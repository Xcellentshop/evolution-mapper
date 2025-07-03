import 'package:dji_mapper/shared/aircraft_settings.dart';
import 'package:dji_waypoint_engine/engine.dart';
import 'package:dji_mapper/components/text_field.dart';
import 'package:dji_mapper/shared/value_listeneables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dji_mapper/l10n/app_localizations.dart';

class AircraftBar extends StatefulWidget {
  const AircraftBar({super.key});

  @override
  State<AircraftBar> createState() => _AircraftBarState();
}

class _AircraftBarState extends State<AircraftBar> {
  void _updateSettings(ValueListenables listenables) {
    AircraftSettings.saveAircraftSettings(AircraftSettings(
      altitude: listenables.altitude,
      speed: listenables.speed,
      forwardOverlap: listenables.forwardOverlap,
      sideOverlap: listenables.sideOverlap,
      rotation: listenables.rotation,
      delay: listenables.delayAtWaypoint,
      cameraAngle: listenables.cameraAngle,
      finishAction: listenables.onFinished,
      rcLostAction: listenables.rcLostAction,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Consumer<ValueListenables>(builder: (context, listenables, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                        labelText: l10n.altitude,
                        min: 10,
                        max: 500,
                        onChanged: (m) {
                          listenables.altitude = m.round();
                          _updateSettings(listenables);
                        },
                        defaultValue: listenables.altitude),
                    CustomTextField(
                        labelText: l10n.speed,
                        min: 0.1,
                        max: 9,
                        defaultValue: listenables.speed,
                        onChanged: (speed) {
                          listenables.speed = speed;
                          _updateSettings(listenables);
                        },
                        decimals: 1),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      labelText: l10n.overlap,
                      min: 1,
                      max: 90,
                      defaultValue: listenables.forwardOverlap,
                      onChanged: (percent) {
                        listenables.forwardOverlap = percent.round();
                        _updateSettings(listenables);
                      },
                    ),
                    CustomTextField(
                      labelText: l10n.sidelap,
                      min: 1,
                      max: 90,
                      defaultValue: listenables.sideOverlap,
                      onChanged: (percent) {
                        listenables.sideOverlap = percent.round();
                        _updateSettings(listenables);
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).dividerColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(l10n.rotation),
                              Text("${listenables.rotation}°"),
                            ],
                          ),
                          Slider(
                            value: listenables.rotation.toDouble(),
                            min: -180,
                            max: 180,
                            divisions: 360,
                            label:
                                '${listenables.rotation.toStringAsFixed(0)}°',
                            onChanged: (value) {
                              setState(() {
                                listenables.rotation = value.round();
                                _updateSettings(listenables);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      labelText: l10n.cameraAngle,
                      min: -90,
                      max: 0,
                      defaultValue: listenables.cameraAngle,
                      onChanged: (degrees) {
                        listenables.cameraAngle = degrees.round();
                        _updateSettings(listenables);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: CustomTextField(
                labelText: l10n.delayAtWaypoint,
                min: 0,
                max: 10,
                defaultValue: listenables.delayAtWaypoint,
                onChanged: (delaySeconds) {
                  listenables.delayAtWaypoint = delaySeconds.round();
                  _updateSettings(listenables);
                },
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Align(
                      child: Text(
                        l10n.onFinished,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(spacing: 5.0, runSpacing: 5.0, children: [
                      ChoiceChip(
                          label: Text(l10n.hover),
                          selected:
                              listenables.onFinished == FinishAction.noAction,
                          onSelected: (bool selected) {
                            setState(() {
                              listenables.onFinished = FinishAction.noAction;
                            });
                            _updateSettings(listenables);
                          }),
                      ChoiceChip(
                          label: Text(l10n.rth),
                          selected:
                              listenables.onFinished == FinishAction.goHome,
                          onSelected: (bool selected) {
                            setState(() {
                              listenables.onFinished = FinishAction.goHome;
                            });
                            _updateSettings(listenables);
                          }),
                      ChoiceChip(
                          label: Text(l10n.land),
                          selected:
                              listenables.onFinished == FinishAction.autoLand,
                          onSelected: (bool selected) {
                            setState(() {
                              listenables.onFinished = FinishAction.autoLand;
                            });
                            _updateSettings(listenables);
                          }),
                      ChoiceChip(
                          label: Text(l10n.goToFirstWaypoint),
                          selected:
                              listenables.onFinished == FinishAction.gotoFirstWaypoint,
                          onSelected: (bool selected) {
                            setState(() {
                              listenables.onFinished = FinishAction.gotoFirstWaypoint;
                            });
                            _updateSettings(listenables);
                          }),
                    ]),
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
                    const SizedBox(height: 10),
                    Align(
                      child: Text(
                        l10n.onRcLost,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(spacing: 5.0, runSpacing: 5.0, children: [
                      ChoiceChip(
                          label: Text(l10n.hover),
                          selected:
                              listenables.rcLostAction == RCLostAction.hover,
                          onSelected: (bool selected) {
                            setState(() {
                              listenables.rcLostAction = RCLostAction.hover;
                            });
                            _updateSettings(listenables);
                          }),
                      ChoiceChip(
                          label: Text(l10n.rth),
                          selected:
                              listenables.rcLostAction == RCLostAction.goBack,
                          onSelected: (bool selected) {
                            setState(() {
                              listenables.rcLostAction = RCLostAction.goBack;
                            });
                            _updateSettings(listenables);
                          }),
                      ChoiceChip(
                          label: Text(l10n.land),
                          selected:
                              listenables.rcLostAction == RCLostAction.landing,
                          onSelected: (bool selected) {
                            setState(() {
                              listenables.rcLostAction = RCLostAction.landing;
                            });
                            _updateSettings(listenables);
                          }),
                    ]),
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
