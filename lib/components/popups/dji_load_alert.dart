import 'package:dji_mapper/main.dart';
import 'package:flutter/material.dart';
import 'package:dji_mapper/l10n/app_localizations.dart';

class DjiLoadAlert extends StatefulWidget {
  const DjiLoadAlert({super.key, this.showCheckbox = true});

  /// Whether to show the "Do not show again" checkbox.
  ///
  /// Defaults to `true`.
  final bool showCheckbox;

  @override
  State<DjiLoadAlert> createState() => _DjiLoadAlertState();
}

class _DjiLoadAlertState extends State<DjiLoadAlert> {
  bool _doNotShowAgain = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return AlertDialog(
      title: Text(l10n.loadMissionIntoDjiFly),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.step1, style: TextStyle(fontWeight: FontWeight.bold)),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: '• ${l10n.openDjiFly}',
                      style: TextStyle(color: Colors.blue)),
                  TextSpan(
                      text: ' - ${l10n.createNewMission} - '),
                  TextSpan(
                      text: l10n.quitDjiFly,
                      style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            Text(
                "▪ [${l10n.recentDateStamp}]",
                style: TextStyle(fontStyle: FontStyle.italic)),
            const SizedBox(height: 8),
            Text(l10n.step2, style: TextStyle(fontWeight: FontWeight.bold)),
            Text("▪ ${l10n.iosPath}"),
            Text("▪ ${l10n.androidPath}"),
            const SizedBox(height: 4),
            Text(
                """a) ${l10n.selectMissionFolder}
b) ${l10n.guidExample}
c) ${l10n.renameKmzFile}
${l10n.guidExample2}
d) ${l10n.uploadRenamedKmz}"""),
            Text(l10n.openDjiFly,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "▪ ${l10n.selectUploadedMission}"),
            Text(l10n.examineWaypoints),
            const SizedBox(height: 8),
            Text(
                l10n.doNotModifyMission,
                style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: widget.showCheckbox
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: [
            if (widget.showCheckbox)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox.adaptive(
                      value: _doNotShowAgain,
                      onChanged: (value) =>
                          setState(() => _doNotShowAgain = value!)),
                  GestureDetector(
                      onTap: () => setState(() {
                            _doNotShowAgain = !_doNotShowAgain;
                          }),
                      child: Text(l10n.doNotShowThisAgain)),
                ],
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                prefs.setBool("djiWarningDoNotShow", _doNotShowAgain);
              },
              child: Text(l10n.done),
            ),
          ],
        ),
      ],
    );
  }
}
