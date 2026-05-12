import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class LocationPermissionScreen extends StatelessWidget {
  final Function() onPermissionGranted;

  const LocationPermissionScreen({Key? key, required this.onPermissionGranted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konum İzni'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Uygulama konum izni gerektiriyor',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Konum izni vermek için lütfen izin ver butonuna tıklayın.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _requestPermission(context);
              },
              child: const Text('İzin Ver'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _requestPermission(BuildContext context) async {
    var result = await Permission.location.request();
    if (result.isGranted) {
      onPermissionGranted(); // İzin verildiğinde geri dönüş yapılıyor
    } else {
      // İsterseniz bir uyarı gösterilebilir.
    }
  }
}
