// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'DJI Mapper';

  @override
  String get theme => 'Theme';

  @override
  String get github => 'GitHub';

  @override
  String get helpLoadingMission => 'Help loading mission';

  @override
  String get dji => 'DJI';

  @override
  String get litchi => 'Litchi';

  @override
  String get updateAvailable => 'Update available';

  @override
  String get later => 'Later';

  @override
  String get ignoreThisVersion => 'Ignore this version';

  @override
  String get download => 'Download';

  @override
  String get searchLocation => 'Search location';

  @override
  String get info => 'Info';

  @override
  String get aircraft => 'Aircraft';

  @override
  String get camera => 'Camera';

  @override
  String get file => 'File';

  @override
  String get createPhotoPoints => 'Create Photo Points';

  @override
  String get showPhotoPoints => 'Show Photo Points';

  @override
  String get showWaypoints => 'Show Waypoints';

  @override
  String get fillGrid => 'Fill Grid';

  @override
  String numberOfPhotos(int count) {
    return 'Number of photos: $count';
  }

  @override
  String numberOfWaypoints(int count) {
    return 'Number of waypoints: $count';
  }

  @override
  String flightDistance(int distance) {
    return 'Flight distance: $distance m';
  }

  @override
  String area(int area) {
    return 'Area: $area m²';
  }

  @override
  String estimatedFlightTime(int time) {
    return 'Estimated flight time: $time minutes';
  }

  @override
  String recommendedShutterSpeed(String speed) {
    return 'Recommended shutter speed: $speed or faster';
  }

  @override
  String get altitude => 'Altitude (m)';

  @override
  String get speed => 'Speed (m/s)';

  @override
  String get overlap => 'Overlap (%)';

  @override
  String get sidelap => 'Sidelap (%)';

  @override
  String get rotation => 'Rotation (°)';

  @override
  String get cameraAngle => 'Camera angle (deg)';

  @override
  String get delayAtWaypoint => 'Delay at Waypoint (sec)';

  @override
  String get onFinished => 'On Finished:';

  @override
  String get hover => 'Hover';

  @override
  String get rth => 'RTH';

  @override
  String get land => 'Land';

  @override
  String get goToFirstWaypoint => 'Go to first waypoint';

  @override
  String get onRcLost => 'On RC Lost:';

  @override
  String get cameraPreset => 'Camera Preset:';

  @override
  String get presetTitle => 'Preset Title';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get add => 'Add';

  @override
  String get delete => 'Delete';

  @override
  String get sensorWidth => 'Sensor Width (mm)';

  @override
  String get sensorHeight => 'Sensor Height (mm)';

  @override
  String get focalLength => 'Focal Length (mm)';

  @override
  String get imageWidth => 'Image Width (px)';

  @override
  String get imageHeight => 'Image Height (px)';

  @override
  String get saveAsDjiFlyWaypointMission => 'Save as DJI Fly Waypoint Mission';

  @override
  String get saveAsLitchiMission => 'Save as Litchi Mission';

  @override
  String get importExportMappingArea => 'Import/Export Mapping Area';

  @override
  String get importFromKml => 'Import from KML';

  @override
  String get exportToKml => 'Export to KML';

  @override
  String get selectPolygon => 'Select Polygon';

  @override
  String get load => 'Load';

  @override
  String get missionExportCancelled => 'Mission export cancelled';

  @override
  String get missionExportedSuccessfully => 'Mission exported successfully';

  @override
  String get areaImportedSuccessfully => 'Area imported successfully';

  @override
  String get areaExportCancelled => 'Area export cancelled';

  @override
  String get areaExportedSuccessfully => 'Area exported successfully';

  @override
  String get noWaypointsToExport =>
      'No waypoints to export. Please add waypoints first';

  @override
  String get noFileSelected => 'No file selected. Import cancelled';

  @override
  String get noPolygonsFound => 'No polygons found in KML. Import cancelled';

  @override
  String get loadMissionIntoDjiFly => 'Load mission into DJI Fly';

  @override
  String get loadMissionIntoLitchi => 'Load mission into Litchi';

  @override
  String get step1 => 'Step 1';

  @override
  String get step2 => 'Step 2';

  @override
  String get step3 => 'Step 3';

  @override
  String get step4 => 'Step 4';

  @override
  String get done => 'Done';

  @override
  String get doNotShowThisAgain => 'Do not show this again';

  @override
  String get exportYourSurveyMission => 'Export your Survey Mission';

  @override
  String get importExportMappingAreaTitle => 'Import/Export Mapping Area';

  @override
  String get openDjiFly => 'Open DJI Fly';

  @override
  String get quitDjiFly => 'Quit DJI Fly';

  @override
  String get createNewMission =>
      'Create a new Mission [simple as 1wp] and save';

  @override
  String get recentDateStamp =>
      'This will give it a recent date stamp making it easier to find & select';

  @override
  String get iosPath => 'iOS - Goto FILES/DJI Fly/wayline_mission/';

  @override
  String get androidPath =>
      'Android/DJI RC = Goto Android/data/dji.go.v5/files/waypoint';

  @override
  String get selectMissionFolder =>
      'Select most recently created Mission Folder by date/time';

  @override
  String get guidExample =>
      'Its name will be in the form of a GUID. Example: 6103D3C8-E79A-4B48-BBFE-50932D2E1306';

  @override
  String get renameKmzFile =>
      'Rename KMZ file that your importing to match the name of this mission on your device.';

  @override
  String get guidExample2 =>
      'Example: 6103D3C8-E79A-4B48-BBFE-50932D2E1306.kmz';

  @override
  String get uploadRenamedKmz =>
      'Upload the renamed KMZ into selected mission folder on your device replacing existing KMZ';

  @override
  String get selectUploadedMission =>
      'Select the mission you just uploaded, should be on the top of the list';

  @override
  String get examineWaypoints =>
      'Examine all waypoints before you Fly to be sure they are configured as expected.';

  @override
  String get doNotModifyMission =>
      'Do not modify or save the mission from inside DJI Fly, because it doesn\'t support straight curves, and will break the mission.';

  @override
  String get setSettingsCorrectly =>
      'Set the settings correctly, highlighted in blue are the important settings.';

  @override
  String get finishActionSame =>
      'The Finish Action should be set the same as in the DJI Mapper';

  @override
  String get clickMissionsImport =>
      'Click on the \'Missions -> Import\' and select the mission file.';

  @override
  String get saveMissionName =>
      'Save the mission with a name and it will automatically sync to your device.';
}
