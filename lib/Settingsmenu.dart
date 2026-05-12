import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anabasis/theme_notifier.dart';
import 'package:anabasis/generated/app_localizations.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'main.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = context.watch<ThemeNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.ayarlar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.tema,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Icon(
                    themeNotifier.themeMode == ThemeMode.system
                        ? (ThemeMode.system == ThemeMode.dark)
                        ? Icons.nightlight_round_outlined
                        : Icons.sunny
                        : themeNotifier.themeMode == ThemeMode.dark
                        ? Icons.nightlight_round
                        : Icons.sunny,
                    color: themeNotifier.themeMode == ThemeMode.dark
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  Switch(
                    value: themeNotifier.themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      themeNotifier.toggleTheme();
                      restartApp(context);
                    },
                    activeTrackColor: Colors.blue,
                    activeColor: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Row(
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.dil}:',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    AppLocalizations.of(context)!.flame +
                        AppLocalizations.of(context)!.lan,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              onTap: () {
                _showLanguageMenu(context);
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Row(
                children: [
                  Text(AppLocalizations.of(context)!.renk),
                  const Spacer(),
                  Container(
                    width: 30,
                    height: 30,
                    color: themeNotifier.primaryColor,
                    margin: const EdgeInsets.only(right: 10),
                  ),
                  const Icon(Icons.color_lens),
                ],
              ),
              onTap: () {
                _primaryColorMenu(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageMenu(BuildContext context) {
    ThemeNotifier themeNotifier = context.read<ThemeNotifier>();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Türkçe'),
              leading: Image.asset('assets/flags/tr.png', width: 25, height: 15),
              onTap: () {
                themeNotifier.setLocale(const Locale('tr'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Deutsch'),
              leading: Image.asset('assets/flags/de.png', width: 25, height: 15),
              onTap: () {
                themeNotifier.setLocale(const Locale('de'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('English'),
              leading: Image.asset('assets/flags/en.png', width: 25, height: 15),
              onTap: () {
                themeNotifier.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Русский'),
              leading: Image.asset('assets/flags/ru.png', width: 25, height: 15),
              onTap: () {
                themeNotifier.setLocale(const Locale('ru'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Arabic'),
              leading: Image.asset('assets/flags/ar.png', width: 25, height: 15),
              onTap: () {
                themeNotifier.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
            // Diğer dilleri ekleyebilirsiniz
          ],
        );
      },
    );
  }
  void restartApp(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MyApp(),
      ),
          (route) => false,
    );
  }

  void _primaryColorMenu(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color tempColor = themeNotifier.primaryColor;
        return AlertDialog(
          title:  Text(AppLocalizations.of(context)!.renksec),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: themeNotifier.primaryColor,
              onColorChanged: (color) {
                tempColor = color;
              },
              showLabel: false,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              child:  Text(AppLocalizations.of(context)!.iptal),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child:  Text(AppLocalizations.of(context)!.tamam),
              onPressed: () {
                themeNotifier.changePrimaryColor(tempColor);
                Navigator.pop(context);
                restartApp(context);
              },
            ),
          ],
        );
      },
    );
  }
}
