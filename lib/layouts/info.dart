import 'package:dji_mapper/core/drone_mapping_engine.dart';
import 'package:dji_mapper/shared/value_listeneables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dji_mapper/l10n/app_localizations.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return SingleChildScrollView(child:
        Consumer<ValueListenables>(builder: (context, listenables, child) {
      var totalDistance = 0;
      var area = 0;
      var recommendedShutterSpeed = "0";
      if (listenables.polygon.length > 2) {
        totalDistance = DroneMappingEngine.calculateTotalDistance(
                listenables.flightLine?.points ?? [])
            .round();
        area = DroneMappingEngine.calculateArea(listenables.polygon).round();
        recommendedShutterSpeed =
            DroneMappingEngine.calculateRecommendedShutterSpeed(
          altitude: listenables.altitude,
          sensorWidth: listenables.sensorWidth,
          focalLength: listenables.focalLength,
          imageWidth: listenables.imageWidth,
          droneSpeed: listenables.speed,
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
              title: Text(l10n.createPhotoPoints),
              value: listenables.createCameraPoints,
              onChanged: (value) {
                setState(() {
                  listenables.createCameraPoints = value;
                });
              }),
          SwitchListTile(
              title: Text((listenables.createCameraPoints) ? l10n.showPhotoPoints : l10n.showWaypoints),
              value: listenables.showPoints,
              onChanged: (value) {
                setState(() {
                  listenables.showPoints = value;
                });
              }),
          SwitchListTile(
              title: Text(l10n.fillGrid),
              value: listenables.fillGrid,
              onChanged: (value) {
                setState(() {
                  listenables.fillGrid = value;
                });
              }),
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              if(listenables.createCameraPoints)
                Text(l10n.numberOfPhotos(listenables.photoLocations.length),
                    style: const TextStyle(fontSize: 16))
              else
                Text(l10n.numberOfWaypoints(listenables.photoLocations.length),
                    style: const TextStyle(fontSize: 16)),
              const Divider(),
              Text(l10n.flightDistance(totalDistance.toDouble()),
                  style: const TextStyle(fontSize: 16)),
              const Divider(),
              Text(l10n.area(area.toDouble()), style: const TextStyle(fontSize: 16)),
              const Divider(),
              Text(
                  l10n.estimatedFlightTime((((totalDistance / listenables.speed) + (listenables.photoLocations.length * listenables.delayAtWaypoint)) / 60).round()),
                  style: const TextStyle(fontSize: 16)),
              const Divider(),
              Text(
                  l10n.recommendedShutterSpeed(double.tryParse(recommendedShutterSpeed) ?? 0),
                  style: const TextStyle(fontSize: 16)),
            ]),
          ))
        ],
      );
    }));
  }
}
