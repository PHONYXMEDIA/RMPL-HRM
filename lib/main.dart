import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/extensions/object/log.dart';
import 'package:rmpl_hrm/features/app/app.dart';
import 'package:rmpl_hrm/features/geolocation/view/background_service.dart';
import 'package:rmpl_hrm/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

late Size mq;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  'Handling a background message: ${message.messageId}'.log();
}

Future<void> execute(
  InternetConnectionChecker internetConnectionChecker,
) async {
  print('''The statement 'this machine is connected to the Internet' is: ''');
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  print(
    isConnected.toString(),
  );

  print(
    'Current status: ${await InternetConnectionChecker().connectionStatus}',
  );

  final StreamSubscription<InternetConnectionStatus> listener =
      InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    },
  );

  // await Future<void>.delayed(const Duration(seconds: 30));
  await listener.cancel();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await execute(InternetConnectionChecker());

  final InternetConnectionChecker customInstance =
      InternetConnectionChecker.createInstance();

  await execute(customInstance);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // BackgroundService.start();

  await initializeService();

  final messaging = FirebaseMessaging.instance;

  await messaging.setAutoInitEnabled(true);

  await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );

  messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print("Handling a foreground message: ${message.messageId}");
  // });
  runApp(
    ProviderScope(
      observers: [
        AppObserver(),
      ],
      child: const App(),
    ),
  );
}

Future<void> _checkLocationPermission() async {
  final permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    await _requestLocationPermission();
  } else if (permission == LocationPermission.deniedForever) {
    print('Location permission is permanently denied');
  }
}

Future<void> _requestLocationPermission() async {
  LocationPermission permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    print('Location permission denied');
  } else if (permission == LocationPermission.deniedForever) {
    print('Location permission permanently denied');
  }
}

// void _startLocationUpdates() async {
//   _positionStream = Geolocator.getPositionStream(
//     locationSettings: const LocationSettings(
//       accuracy: LocationAccuracy.high,
//       distanceFilter: 10,
//     ),
//   ).listen((Position position) {
 
//     print('Live Latitude: ${_currentPosition.latitude}');
//     print('Live Longitude: ${_currentPosition.longitude}');
//   }, onError: (dynamic error) {
//     print('Error obtaining location: $error');
//   });
// }
