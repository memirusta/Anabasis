// about_page.dart

import 'package:flutter/material.dart';
import 'package:anabasis/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:anabasis/theme_notifier.dart';


class AboutPage extends StatelessWidget {
  final String url = 'http://www.macka.gov.tr/anabasis-yolu';

  const AboutPage({Key? key}) : super(key: key);

  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.yol_app),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(10), // Kutu içindeki boşluk
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Kutu kenarları için yuvarlama
                  color: Provider.of<ThemeNotifier>(context).primaryColor, // Sarı arka plan
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0), // Resmin kenar yuvarlama
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://lh3.googleusercontent.com/p/AF1QipOhhdaR-JokP5cOQaSS_wbaWmyRLiD8xW_pTqkl=s680-w680-h510'), // Resim URL'si
                        fit: BoxFit.cover, // Resmi kapsama şekli
                      ),
                    ),
                    child: const SizedBox(
                      width: 500, // Resim genişliği
                      height: 220, // Resim yüksekliği
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Provider.of<ThemeNotifier>(context, listen: false).primaryColor,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text('(${AppLocalizations.of(context)!.tepe}  Maçka/Trazbon)', style: const TextStyle(color: Colors.black),),
              ),
            ),

            const SizedBox(height: 16.0),
            Text(
              AppLocalizations.of(context)!.hakkindasayfasi,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              AppLocalizations.of(context)!.anabasis_hakkinda,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            // Daha fazla resim ve metin ekleyebilirsiniz
            // Wikipedia linki için bir GestureDetector ekleyebilirsiniz
            GestureDetector(
              onTap: () {
                _launchURL();
              },
              child: Text(
                AppLocalizations.of(context)!.anabasis_hakkinda2,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.nasil_baslik,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              "${AppLocalizations.of(context)!.anamenu}:",
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(AppLocalizations.of(context)!.nasil_kullanilir),
            const SizedBox(height: 16.0),
            Text(
              AppLocalizations.of(context)!.yan_menu,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(AppLocalizations.of(context)!.yan_menu_anlatim)

          ],
        ),
      ),
    );
  }
}
