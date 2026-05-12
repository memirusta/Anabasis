import 'package:flutter/material.dart';
import 'package:anabasis/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class SumelaButon extends StatelessWidget {
  final double destinationLatitude;
  final double destinationLongitude;

  const SumelaButon({Key? key, 
    required this.destinationLatitude,
    required this.destinationLongitude,
  }) : super(key: key);

  void launchMapsUrl(double originLatitude, double originLongitude) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&origin=$originLatitude,$originLongitude&destination=$destinationLatitude,$destinationLongitude&travelmode=driving';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getAndLaunchDirections() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      launchMapsUrl(position.latitude, position.longitude);
    } catch (e) {
      print('Konum alınamadı: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: getAndLaunchDirections,
      child: Text(AppLocalizations.of(context)!.gitmek),
    );
  }
}

class SumelaSayfa extends StatelessWidget {
  const SumelaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.smanastir),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/Sumela.JPG',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/2d61db5b-a8ce-436f-a220-43115a12bb5a.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/200px-SumelaFresco (1).jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)!.sumela1,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)!.sumela2,
              ),
              const SizedBox(height: 20),
              const SumelaButon(
                destinationLatitude:
                    40.69022, // Sümela Manastırının latitude koordinatı
                destinationLongitude:
                    39.65849, // Sümela Manastırının longitude koordinatı
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Müze Haritasını Göster'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KalintiButon extends StatelessWidget {
  final double destinationLatitude;
  final double destinationLongitude;

  const KalintiButon({Key? key, 
    required this.destinationLatitude,
    required this.destinationLongitude,
  }) : super(key: key);

  void launchMapsUrl(double originLatitude, double originLongitude) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&origin=$originLatitude,$originLongitude&destination=$destinationLatitude,$destinationLongitude&travelmode=driving';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getAndLaunchDirections() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      launchMapsUrl(position.latitude, position.longitude);
    } catch (e) {
      print('Konum alınamadı: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: getAndLaunchDirections,
      child: Text(AppLocalizations.of(context)!.gitmek),
    );
  }
}

class VazelonButon extends StatelessWidget {
  final double destinationLatitude;
  final double destinationLongitude;

  const VazelonButon({Key? key, 
    required this.destinationLatitude,
    required this.destinationLongitude,
  }) : super(key: key);

  void launchMapsUrl(double originLatitude, double originLongitude) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&origin=$originLatitude,$originLongitude&destination=$destinationLatitude,$destinationLongitude&travelmode=driving';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getAndLaunchDirections() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      launchMapsUrl(position.latitude, position.longitude);
    } catch (e) {
      print('Konum alınamadı: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: getAndLaunchDirections,
      child: Text(AppLocalizations.of(context)!.gitmek),
    );
  }
}

class VazelonSayfa extends StatelessWidget {
  final String url;
  VazelonSayfa(BuildContext context, {Key? key})
      : url = (AppLocalizations.of(context)!.vazelonmurl), super(key: key);

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
        title: Text(AppLocalizations.of(context)!.vmanastir),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/vazelon1.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/vazelon2.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/vazelon3.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _launchURL();
                },
                child: Text(
                  AppLocalizations.of(context)!.dahafazla,
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const VazelonButon(
                destinationLatitude:
                    40.76198, // Sümela Manastırının latitude koordinatı
                destinationLongitude:
                    39.52998, // Sümela Manastırının longitude koordinatı
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KustulButon extends StatelessWidget {
  final double destinationLatitude;
  final double destinationLongitude;

  const KustulButon({Key? key, 
    required this.destinationLatitude,
    required this.destinationLongitude,
  }) : super(key: key);

  void launchMapsUrl(double originLatitude, double originLongitude) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&origin=$originLatitude,$originLongitude&destination=$destinationLatitude,$destinationLongitude&travelmode=driving';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getAndLaunchDirections() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      launchMapsUrl(position.latitude, position.longitude);
    } catch (e) {
      print('Konum alınamadı: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: getAndLaunchDirections,
      child: Text(AppLocalizations.of(context)!.gitmek),
    );
  }
}

class KustulSayfa extends StatelessWidget {
  final String url;
  KustulSayfa(BuildContext context, {Key? key})
      : url = (AppLocalizations.of(context)!.kustulmurl), super(key: key);

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
        title: Text(AppLocalizations.of(context)!.kmanastir),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/kustul1.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/kustul2.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/kustul3.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _launchURL();
                },
                child: Text(
                  AppLocalizations.of(context)!.dahafazla,
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const KustulButon(
                destinationLatitude:
                    40.80275, // Sümela Manastırının latitude koordinatı
                destinationLongitude:
                    39.70733, // Sümela Manastırının longitude koordinatı
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IskopelButon extends StatelessWidget {
  final double destinationLatitude;
  final double destinationLongitude;

  const IskopelButon({Key? key, 
    required this.destinationLatitude,
    required this.destinationLongitude,
  }) : super(key: key);

  void launchMapsUrl(double originLatitude, double originLongitude) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&origin=$originLatitude,$originLongitude&destination=$destinationLatitude,$destinationLongitude&travelmode=driving';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getAndLaunchDirections() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      launchMapsUrl(position.latitude, position.longitude);
    } catch (e) {
      print('Konum alınamadı: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: getAndLaunchDirections,
      child: Text(AppLocalizations.of(context)!.gitmek),
    );
  }
}

class IskopelSayfa extends StatelessWidget {
  const IskopelSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.tepe),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/iskobel-yaylasi-thekes-tepesi1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                width: 400,
                child: Image.asset(
                  'assets/flags/Iskobel-Yaylasi_compressed.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const IskopelButon(
                destinationLatitude:
                    40.67129, // Sümela Manastırının latitude koordinatı
                destinationLongitude:
                    39.69665, // Sümela Manastırının longitude koordinatı
              ),
            ],
          ),
        ),
      ),
    );
  }
}
