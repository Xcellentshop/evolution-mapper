import 'package:dji_mapper/components/popups/dji_load_alert.dart';
import 'package:dji_mapper/shared/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:dji_mapper/l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'popups/litchi_load_alert.dart';

class MappingAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MappingAppBar({super.key});

  @override
  State<MappingAppBar> createState() => _MappingAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _MappingAppBarState extends State<MappingAppBar> {
  String _version = "";

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((value) {
      setState(() {
        _version = "V${value.version} (build ${value.buildNumber})";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<ThemeManager>(
      builder: (context, theme, child) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0057B8), Color(0xFF00B8D9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          border: Border(
            bottom: BorderSide(
              color: Color(0x22000000),
              width: 1.5,
            ),
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset(
                  "assets/logo.png",
                  width: 36,
                  height: 36,
                ),
              ),
              GestureDetector(
                onTap: () => showAboutDialog(
                    context: context,
                    applicationVersion: _version,
                    applicationLegalese: "© 2024 Yaroslav Syubayev",
                    applicationIcon: Image.asset(
                      "assets/logo.png",
                      width: 60,
                    )),
                child: Text(
                  l10n.appTitle,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Material(
                color: Colors.transparent,
                child: PopupMenuButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  icon: Icon(Icons.more_vert, color: Colors.white),
                  offset: const Offset(0, 50),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: "theme",
                        child: ListTile(
                          leading: Icon(
                              Theme.of(context).brightness == Brightness.light
                                  ? Icons.light_mode
                                  : Icons.dark_mode,
                              color: Colors.black87),
                          title: Text(l10n.theme),
                        )),
                    PopupMenuItem(
                      value: "github",
                      child: ListTile(
                        leading: Icon(Icons.open_in_browser, color: Colors.black87),
                        title: Text(l10n.github),
                      ),
                    ),
                    PopupMenuItem(
                        child: PopupMenuButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      offset: const Offset(-210, 0),
                      child: ListTile(
                        leading: Icon(Icons.help_outline, color: Colors.black87),
                        title: Text(l10n.helpLoadingMission),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: "dji_help",
                          child: Text(l10n.dji),
                        ),
                        PopupMenuItem(
                          value: "litchi_help",
                          child: ListTile(
                            title: Text(l10n.litchi),
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        switch (value) {
                          case "dji_help":
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const DjiLoadAlert(showCheckbox: false));
                          case "litchi_help":
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const LitchiLoadAlert(showCheckbox: false));
                        }
                      },
                    )),
                  ],
                  onSelected: (value) {
                    switch (value) {
                      case "theme":
                        theme.toggleTheme();
                        break;
                      case "github":
                        launchUrl(
                            Uri.https("github.com", "Xcellentshop/evolution-mapper"));
                      case "help":
                        launchUrl(Uri.https("mavicpilots.com",
                            "/threads/waypoints-how-to-back-up-export-import.135283"));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
