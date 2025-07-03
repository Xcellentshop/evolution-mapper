import 'package:dji_mapper/components/text_field.dart';
import 'package:dji_mapper/main.dart';
import 'package:dji_mapper/presets/camera_preset.dart';
import 'package:dji_mapper/presets/preset_manager.dart';
import 'package:dji_mapper/shared/value_listeneables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dji_mapper/l10n/app_localizations.dart';

class CameraBar extends StatefulWidget {
  const CameraBar({super.key});

  @override
  State<CameraBar> createState() => _CameraBarState();
}

class _CameraBarState extends State<CameraBar> {
  late List<CameraPreset> _presets = PresetManager.getPresets();

  void _updatePreset(ValueListenables listenables) {
    PresetManager.updatePreset(
        _presets.indexOf(listenables.selectedCameraPreset!),
        CameraPreset(
            name: listenables.selectedCameraPreset!.name,
            defaultPreset: false,
            sensorWidth: listenables.sensorWidth,
            sensorHeight: listenables.sensorHeight,
            focalLength: listenables.focalLength,
            imageWidth: listenables.imageWidth,
            imageHeight: listenables.imageHeight));
  }

  /// Always called from the `AlertDialog`
  void _addPreset(
      ValueListenables listenables, TextEditingController nameController) {
    final CameraPreset newPreset = CameraPreset(
        defaultPreset: false,
        name: nameController.text,
        sensorWidth: listenables.sensorWidth,
        sensorHeight: listenables.sensorHeight,
        focalLength: listenables.focalLength,
        imageWidth: listenables.imageWidth,
        imageHeight: listenables.imageHeight);
    PresetManager.addPreset(newPreset);
    _presets = PresetManager.getPresets();
    Provider.of<ValueListenables>(context, listen: false).selectedCameraPreset =
        newPreset;
    listenables.notify();
    // Update latest preset
    prefs.setString("latestPreset", listenables.selectedCameraPreset!.name);
    Navigator.pop(context);
  }

  void _updateProvider(ValueListenables listenables) {
    listenables.sensorWidth = listenables.selectedCameraPreset!.sensorWidth;
    listenables.sensorHeight = listenables.selectedCameraPreset!.sensorHeight;
    listenables.focalLength = listenables.selectedCameraPreset!.focalLength;
    listenables.imageWidth = listenables.selectedCameraPreset!.imageWidth;
    listenables.imageHeight = listenables.selectedCameraPreset!.imageHeight;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Consumer<ValueListenables>(builder: (context, listenables, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(l10n.cameraPreset),
                const SizedBox(width: 10),
                DropdownButton(
                    value: listenables.selectedCameraPreset,
                    items: List.generate(
                        _presets.length,
                        (i) => DropdownMenuItem(
                              value: _presets[i],
                              child: Text(_presets[i].name),
                            )),
                    onChanged: (item) {
                      _presets = PresetManager.getPresets();
                      listenables.selectedCameraPreset = item ?? _presets[0];

                      // Update listenables
                      _updateProvider(listenables);

                      // Update latest preset
                      prefs.setString("latestPreset",
                          listenables.selectedCameraPreset!.name);
                    }),
                const SizedBox(
                  width: 6,
                ),
                IconButton(
                  onPressed: () {
                    final nameController = TextEditingController();
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(l10n.presetTitle),
                              content: TextField(
                                autocorrect: false,
                                autofocus: true,
                                onChanged: (text) {
                                  nameController.text = text;
                                },
                                onSubmitted: (value) =>
                                    _addPreset(listenables, nameController),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(l10n.cancel)),
                                TextButton(
                                    onPressed: () =>
                                        _addPreset(listenables, nameController),
                                    child: Text(l10n.save)),
                              ],
                            ));
                  },
                  icon: const Icon(Icons.add),
                  tooltip: l10n.add,
                ),
                IconButton(
                  onPressed: listenables.selectedCameraPreset!.defaultPreset
                      ? null
                      : () {
                          final int previousIndex = _presets
                              .indexOf(listenables.selectedCameraPreset!);
                          PresetManager.deletePreset(
                              listenables.selectedCameraPreset!);
                          _presets = PresetManager.getPresets();
                          listenables.selectedCameraPreset =
                              _presets[previousIndex - 1];
                          prefs.setString(
                            "latestPreset",
                            listenables.selectedCameraPreset!.name,
                          );
                          listenables.notify();
                        },
                  icon: const Icon(Icons.delete),
                  tooltip: listenables.selectedCameraPreset!.defaultPreset
                      ? "Can't delete default preset"
                      : l10n.delete,
                ),
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      labelText: l10n.sensorWidth,
                      min: 1,
                      max: 50,
                      onChanged: (mm) {
                        listenables.sensorWidth = mm;
                        _updatePreset(listenables);
                      },
                      defaultValue: listenables.sensorWidth,
                      decimals: 1,
                      enabled: !listenables.selectedCameraPreset!.defaultPreset,
                    ),
                    CustomTextField(
                      labelText: l10n.sensorHeight,
                      min: 1,
                      max: 50,
                      defaultValue: listenables.sensorHeight,
                      onChanged: (mm) {
                        listenables.sensorHeight = mm;
                        _updatePreset(listenables);
                      },
                      decimals: 1,
                      enabled: !listenables.selectedCameraPreset!.defaultPreset,
                    ),
                    CustomTextField(
                      labelText: l10n.focalLength,
                      min: 1,
                      max: 50,
                      defaultValue: listenables.focalLength,
                      onChanged: (mm) {
                        listenables.focalLength = mm;
                        _updatePreset(listenables);
                      },
                      decimals: 2,
                      enabled: !listenables.selectedCameraPreset!.defaultPreset,
                    ),
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
                      labelText: l10n.imageWidth,
                      min: 1,
                      max: 10000,
                      defaultValue: listenables.imageWidth,
                      onChanged: (px) {
                        listenables.imageWidth = px.round();
                        _updatePreset(listenables);
                      },
                      enabled: !listenables.selectedCameraPreset!.defaultPreset,
                    ),
                    CustomTextField(
                      labelText: l10n.imageHeight,
                      min: 1,
                      max: 10000,
                      defaultValue: listenables.imageHeight,
                      onChanged: (px) {
                        listenables.imageHeight = px.round();
                        _updatePreset(listenables);
                      },
                      enabled: !listenables.selectedCameraPreset!.defaultPreset,
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
