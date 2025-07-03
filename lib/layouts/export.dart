import 'package:dji_mapper/core/drone_mapper_format.dart';
import 'package:dji_mapper/shared/map_provider.dart';
import 'package:flutter_map/flutter_map.dart' hide Polygon;
import 'package:geoxml/geoxml.dart';
import 'package:latlong2/latlong.dart';
import 'package:universal_io/io.dart';
import 'package:dji_mapper/components/popups/dji_load_alert.dart';
import 'package:dji_mapper/components/popups/litchi_load_alert.dart';
import 'package:dji_mapper/main.dart';
import 'package:litchi_waypoint_engine/engine.dart' as litchi;
import 'package:universal_html/html.dart' as html;
import 'package:archive/archive.dart';
import 'package:dji_waypoint_engine/engine.dart';
import 'package:dji_mapper/shared/value_listeneables.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:provider/provider.dart';
import 'package:dji_mapper/l10n/app_localizations.dart';

class ExportBar extends StatefulWidget {
  const ExportBar({super.key});

  @override
  State<ExportBar> createState() => ExportBarState();
}

class ExportBarState extends State<ExportBar> {
  Future<void> _exportForDJIFly(ValueListenables listenables) async {
    final l10n = AppLocalizations.of(context)!;
    
    var missionConfig = MissionConfig(

        /// Always fly safely
        /// This is the default for DJI Fly anyway
        flyToWaylineMode: FlyToWaylineMode.safely,

        /// This will be added later
        finishAction: listenables.onFinished,

        /// To comply with EU regulations
        /// Always execute lost action on RC signal lost
        /// do not continue the mission
        exitOnRCLost: ExitOnRCLost.executeLostAction,

        /// For now it's deafult to go back home on RC signal lost
        rcLostAction: listenables.rcLostAction,

        /// The speed to the first waypoint
        /// For now this is the general speed of the mission
        globalTransitionalSpeed: listenables.speed,

        /// Drone information for DJI Fly is default at 68
        /// Unsure what other values there can be
        /// Can't find official documentation
        droneInfo: DroneInfo(droneEnumValue: 68));

    var template = TemplateKml(
        document: KmlDocumentElement(

            /// The author is always `fly` for now
            author: "fly",
            creationTime: DateTime.now(),
            modificationTime: DateTime.now(),

            /// The template and waylines take the same mission config
            /// Not sure why duplication is necessary
            missionConfig: missionConfig));

    var placemarks = _generateDjiPlacemarks(listenables);

    if (placemarks.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(l10n.noWaypointsToExport)));
      return;
    }

    var waylines = WaylinesWpml(
        document: WpmlDocumentElement(
            missionConfig: missionConfig,
            folderElement: FolderElement(
                templateId: 0, // Only one mission, so this is always 0
                waylineId: 0, // Only one wayline, so this is always 0
                speed: listenables.speed,
                placemarks: placemarks)));

    var templateString = template.toXmlString(pretty: true);
    var waylinesString = waylines.toXmlString(pretty: true);

    var encoder = ZipEncoder();
    var archive = Archive();

    archive.addFile(ArchiveFile('template.kml', templateString.length,
        Uint8List.fromList(templateString.codeUnits)));

    archive.addFile(ArchiveFile('waylines.wpml', waylinesString.length,
        Uint8List.fromList(waylinesString.codeUnits)));

    var zipData = encoder.encode(archive);
    var zipBytes = Uint8List.fromList(zipData!);

    String? outputPath;

    if (!kIsWeb) {
      outputPath = await FilePicker.platform.saveFile(
          type: FileType.custom,
          fileName: "output",
          allowedExtensions: ["kmz"],
          dialogTitle: "Save Mission");

      if (outputPath == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.missionExportCancelled)));
        }
        return;
      }

      // File Saver does not save the file on Desktop platforms
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        if (!outputPath.endsWith(".kmz")) {
          outputPath += ".kmz";
        }
        // Save file for non-web platforms
        final file = File(outputPath);
        await file.writeAsBytes(zipBytes);
      }
    } else {
      // Save file for web platform
      outputPath = "output.kmz";
      final blob = html.Blob([zipBytes], 'application/octet-stream');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute("download", "output.kmz")
        ..click();
      html.Url.revokeObjectUrl(url);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.missionExportedSuccessfully)));

      if (!(prefs.getBool("djiWarningDoNotShow") ?? false)) {
        showDialog(
            context: context, builder: (context) => const DjiLoadAlert());
      }
    }
  }

  Future<void> _exportForLithi(ValueListenables listenables) async {
    final l10n = AppLocalizations.of(context)!;
    
    final waypoints = _generateLitchiWaypoints(listenables);

    if (waypoints.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(l10n.noWaypointsToExport)));
      return;
    }

    String csvContent = litchi.LitchiCsv.generateCsv(waypoints);

    String? outputPath;

    if (!kIsWeb) {
      outputPath = await FilePicker.platform.saveFile(
          type: FileType.custom,
          fileName: "litchi_mission",
          allowedExtensions: ["csv"],
          dialogTitle: "Save Mission");

      if (outputPath == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.missionExportCancelled)));
        }
        return;
      }

      // File Saver does not save the file on Desktop platforms
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        if (!outputPath.endsWith(".csv")) {
          outputPath += ".csv";
        }
        // Save file for non-web platforms
        final file = File(outputPath);
        await file.writeAsString(csvContent);
      }
    } else {
      // Save file for web platform
      outputPath = "output.csv";
      final blob = html.Blob([csvContent], 'text/csv');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute("download", "litchi_mission.csv")
        ..click();
      html.Url.revokeObjectUrl(url);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.missionExportedSuccessfully)));
      if (!(prefs.getBool("litchiWarningDoNotShow") ?? false)) {
        showDialog(
            context: context, builder: (context) => const LitchiLoadAlert());
      }
    }
  }

  List<litchi.Waypoint> _generateLitchiWaypoints(ValueListenables listenables) {
    var waypoints = <litchi.Waypoint>[];

    for (var i = 0; i < listenables.photoLocations.length; i++) {
      var location = listenables.photoLocations[i];
      waypoints.add(litchi.Waypoint(
          latitude: location.latitude,
          longitude: location.longitude,
          altitude: listenables.altitude.toInt(),
          speed: listenables.speed.toInt(),
          curveSize: 0.2,
          gimbalPitch: listenables.cameraAngle.toInt()));
    }

    return waypoints;
  }

  List<Placemark> _generateDjiPlacemarks(ValueListenables listenables) {
    var placemarks = <Placemark>[];

    for (var i = 0; i < listenables.photoLocations.length; i++) {
      var location = listenables.photoLocations[i];
      placemarks.add(Placemark(
          point: WaypointPoint(
            longitude: location.longitude,
            latitude: location.latitude,
          ),
          index: i,
          height: listenables.altitude.toInt(),
          speed: listenables.speed,
          headingParam: HeadingParam(
            headingMode: HeadingMode.followWayline,
            headingPathMode: HeadingPathMode.followBadArc,
          ),
          turnParam: TurnParam(
            waypointTurnMode: WaypointTurnMode.coordinateTurn,
            turnDampingDistance: 0,
          ),
          useStraightLine: true,
          actionGroup: null));
    }

    return placemarks;
  }

  Future<void> _importKml() async {
    final l10n = AppLocalizations.of(context)!;
    
    String? inputPath;

    if (!kIsWeb) {
      final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ["kml"],
          dialogTitle: "Import KML");

      if (result == null || result.files.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.noFileSelected)));
        }
        return;
      }

      final file = File(result.files.first.path!);
      final kmlContent = await file.readAsString();

      _processKmlContent(kmlContent);
    } else {
      // Web file picker
      final input = html.FileUploadInputElement()
        ..accept = '.kml'
        ..click();

      input.onChange.listen((event) {
        final file = input.files?.first;
        if (file != null) {
          final reader = html.FileReader();
          reader.onLoad.listen((event) {
            final content = reader.result as String;
            _processKmlContent(content);
          });
          reader.readAsText(file);
        }
      });
    }
  }

  void _processKmlContent(String kmlContent) {
    // TODO: Implementar importação de KML corretamente
    final l10n = AppLocalizations.of(context)!;
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.noPolygonsFound)));
    }
  }

  Future<void> _exportKml() async {
    final l10n = AppLocalizations.of(context)!;
    
    final listenables = Provider.of<ValueListenables>(context, listen: false);

    if (listenables.polygon.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(l10n.noWaypointsToExport)));
      return;
    }

    // final kmlContent = DroneMapperFormat.generateKml(listenables.polygon);
    final kmlContent = '';

    String? outputPath;

    if (!kIsWeb) {
      outputPath = await FilePicker.platform.saveFile(
          type: FileType.custom,
          fileName: "area",
          allowedExtensions: ["kml"],
          dialogTitle: "Save Area");

      if (outputPath == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.areaExportCancelled)));
        }
        return;
      }

      // File Saver does not save the file on Desktop platforms
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        if (!outputPath.endsWith(".kml")) {
          outputPath += ".kml";
        }
        // Save file for non-web platforms
        final file = File(outputPath);
        await file.writeAsString(kmlContent);
      }
    } else {
      // Save file for web platform
      outputPath = "area.kml";
      final blob = html.Blob([kmlContent], 'text/xml');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute("download", "area.kml")
        ..click();
      html.Url.revokeObjectUrl(url);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.areaExportedSuccessfully)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Consumer<ValueListenables>(
        builder: (context, listenables, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        l10n.exportYourSurveyMission,
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () => _exportForDJIFly(listenables),
                            child: Text(l10n.saveAsDjiFlyWaypointMission)),
                        ElevatedButton(
                            onPressed: () => _exportForLithi(listenables),
                            child: Text(l10n.saveAsLitchiMission)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        l10n.importExportMappingAreaTitle,
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () => _importKml(),
                            child: Text(l10n.importFromKml)),
                        ElevatedButton(
                            onPressed: () => _exportKml(),
                            child: Text(l10n.exportToKml)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
