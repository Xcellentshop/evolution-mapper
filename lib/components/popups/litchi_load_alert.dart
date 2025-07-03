import 'package:dji_mapper/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dji_mapper/l10n/app_localizations.dart';

class LitchiLoadAlert extends StatefulWidget {
  const LitchiLoadAlert({super.key, this.showCheckbox = true});

  /// Whether to show the "Do not show again" checkbox.
  ///
  /// Defaults to `true`.
  final bool showCheckbox;

  @override
  State<LitchiLoadAlert> createState() => _LitchiLoadAlertState();
}

class _LitchiLoadAlertState extends State<LitchiLoadAlert> {
  bool _doNotShowAgain = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return AlertDialog(
      title: Text(l10n.loadMissionIntoLitchi),
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
                  const TextSpan(text: '• Go to '),
                  TextSpan(
                    text: 'Litchi Mission Hub',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => launchUrl(Uri.https('flylitchi.com', '/hub')),
                  ),
                  const TextSpan(text: ' and log in.'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(l10n.step2, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "• ${l10n.setSettingsCorrectly}"),
            const SizedBox(height: 4),
            Image.asset(
              'assets/litchi_alert/settings.jpg',
              width: 400,
            ),
            const SizedBox(height: 4),
            Text(
              l10n.finishActionSame,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            Text(l10n.step3, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "• ${l10n.clickMissionsImport}"),
            const SizedBox(height: 4),
            Image.asset('assets/litchi_alert/import.jpg', width: 150),
            const SizedBox(height: 10),
            Text(l10n.step4, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
                "• ${l10n.saveMissionName}"),
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
                prefs.setBool("litchiWarningDoNotShow", _doNotShowAgain);
              },
              child: Text(l10n.done),
            ),
          ],
        ),
      ],
    );
  }
}
