import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/extensions/object/log.dart';
import 'package:rmpl_hrm/features/app/app.dart';
import 'package:rmpl_hrm/features/geolocation/view/background_service.dart';
import 'package:rmpl_hrm/firebase_options.dart';

late Size mq;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  'Handling a background message: ${message.messageId}'.log();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await initializeService(flutterLocalNotificationsPlugin);

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

  await _checkLocationPermission();

  messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    if (event.notification?.title != null && event.notification?.body != null) {
      _showNotification(flutterLocalNotificationsPlugin, event);
    }
  });
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
  var permission = await Geolocator.requestPermission();
  await Geolocator.openAppSettings();
  await Geolocator.openLocationSettings();
  if (permission == LocationPermission.denied) {
    print('Location permission denied');
    permission = await Geolocator.requestPermission();
    await Geolocator.openAppSettings();
    await Geolocator.openLocationSettings();
  } else if (permission == LocationPermission.deniedForever) {
    print('Location permission permanently denied');
    permission = await Geolocator.requestPermission();
    await Geolocator.openAppSettings();
    await Geolocator.openLocationSettings();
  }
}

Future<void> _showNotification(
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  RemoteMessage event,
) async {
  if (event.notification?.title != null && event.notification?.body != null) {
    await flutterLocalNotificationsPlugin.show(
      DateTime.timestamp().millisecond,
      '${event.notification?.title}',
      '${event.notification?.body}',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'location_service',
          'Foreground service',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      ),
    );
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

// Future<void> execute(
//   InternetConnectionChecker internetConnectionChecker,
// ) async {
//   print('''The statement 'this machine is connected to the Internet' is: ''');
//   final bool isConnected = await InternetConnectionChecker().hasConnection;
//   print(
//     isConnected.toString(),
//   );
//
//   print(
//     'Current status: ${await InternetConnectionChecker().connectionStatus}',
//   );
//
//   final StreamSubscription<InternetConnectionStatus> listener =
//       InternetConnectionChecker().onStatusChange.listen(
//     (InternetConnectionStatus status) {
//       switch (status) {
//         case InternetConnectionStatus.connected:
//           print('Data connection is available.');
//           break;
//         case InternetConnectionStatus.disconnected:
//           print('You are disconnected from the internet.');
//           break;
//       }
//     },
//   );
//
//   await listener.cancel();
// }
