import 'package:anabasis/main.dart';
import 'package:flutter/material.dart';
import 'package:anabasis/generated/app_localizations.dart';

class InternetPage extends StatelessWidget {
  const InternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.int),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.signal_wifi_off,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.int,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppLocalizations.of(context)!.intcumle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _restartApp(context);
              },
              child: Text(AppLocalizations.of(context)!.yenidendene),
            ),
          ],
        ),
      ),
    );
  }
}

void _restartApp(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => const MyApp()),
    (Route<dynamic> route) => false,
  );
}
