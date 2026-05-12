import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:anabasis/Historical_Places.dart';
import 'package:anabasis/Settingsmenu.dart';
import 'package:anabasis/generated/app_localizations.dart';
import 'package:anabasis/theme_notifier.dart';
import 'package:share_plus/share_plus.dart';

class SidebarNavigation extends StatelessWidget {
  const SidebarNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Drawer(
          child: ListView(
            // Remove padding
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text(''),
                accountEmail: Text(
                  AppLocalizations.of(context)!.anamenu,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    height: 1.0,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  AppLocalizations.of(context)!.yerler,
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.castle_outlined),
                title: Text(AppLocalizations.of(context)!.tmekan),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contest) => const HistoricPlacesPage()),
                  );
                },
              ),
              /*
              ListTile(
                leading: const Icon(Icons.hotel),
                title: Text(AppLocalizations.of(context)!.otel),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (contest) => const OtelPage()),
                  );
                },
              ),
             */
              const SizedBox(height: 200),
              const Divider(),

              ListTile(
                leading: const Icon(Icons.share),
                title: Text(AppLocalizations.of(context)!.share),
                onTap: () async {
                  final result = await Share.share('https://play.google.com/store/apps/details?id=com.KAL2024.anabasis&hl=en');

                  if (result.status == ShareResultStatus.success) {
                    print('Thank you for your support! <3');
                  }
                },
              ),
              const Divider(),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FloatingActionButton(
                backgroundColor:
                    Provider.of<ThemeNotifier>(context).primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contest) => const SettingsMenu()),
                  );
                },
                child: const Icon(Icons.settings),
              ),
              Text(
                AppLocalizations.of(context)!.ayarlar,
                style: const TextStyle(
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
