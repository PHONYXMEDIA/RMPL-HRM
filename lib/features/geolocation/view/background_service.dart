import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:rmpl_hrm/extensions/object/log.dart';
import 'package:rmpl_hrm/firebase_options.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  const channel = AndroidNotificationChannel(
    'location_service',
    'foreground service',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  if (Platform.isAndroid || Platform.isIOS) {
    await flutterLocalNotificationPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      autoStartOnBoot: true,
      notificationChannelId: 'location_service',
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
  );
}

@pragma('vm:entry-point')
FutureOr<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  Future<void> storeLocationInFirestore(Position position) async {
    try {
      await Firebase.initializeApp(
        name: 'service_app',
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final locationCollection = FirebaseFirestore.instance.collection(
        'user_locations',
      );

      final userId = FirebaseAuth.instance.currentUser?.uid;

      await locationCollection.doc(userId).collection('location_history').add({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'timestamp': FieldValue.serverTimestamp(),
      });
      '---------> Success'.log();
    } catch (e) {
      print('EEEEE:- Error storing location data: $e');
    }
    // await _locationCollection.doc(userId).collection('location_history').add({
    //   'latitude': position.latitude,
    //   'longitude': position.longitude,
    //   'timestamp': FieldValue.serverTimestamp(),
    // }).catchError((error) {
    //   print('Error storing location data: $error');
    // });
  }

  final sub = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    ),
  ).listen((Position position) async {
    print('1111111 Live Latitude: ${position.latitude}');
    print('2222222 Live Longitude: ${position.longitude}');
    await storeLocationInFirestore(position);
  }, onError: (error) {
    print('Error obtaining location: error');
  });

  service.on('stopService').listen((event) async {
    await sub.cancel();
    service.stopSelf();
  });
}

class BackgroundService {
  static const String _serviceKey = 'location_service';
  static const String notificationChannelId = 'my_foreground';
  static const int notificationId = 888;

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> start() async {
    final service = FlutterBackgroundService();

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      notificationChannelId,
      'MY FOREGROUND SERVICE',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FutureOr<bool> onIosBackground(ServiceInstance service) async {
      WidgetsFlutterBinding.ensureInitialized();
      DartPluginRegistrant.ensureInitialized();
      return true;
    }

    Future<void> onStart(ServiceInstance service) async {
      DartPluginRegistrant.ensureInitialized();
      if (service is AndroidServiceInstance) {
        service.on('setAsForeground').listen((event) {
          service.setAsForegroundService();
        });
        service.on('setAsBackground').listen((event) {
          service.setAsBackgroundService();
        });
      }
      service.on('stopService').listen((event) {
        service.stopSelf();
      });
    }

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId: notificationChannelId,
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: notificationId,
      ),
      iosConfiguration: IosConfiguration(
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
    );
    void _startLocationUpdates() {
      Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      ).listen((Position position) {
        flutterLocalNotificationsPlugin.show(
          notificationId,
          'Live Location Update',
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              notificationChannelId,
              'Live Location Updates',
            ),
          ),
        );

        _storeLocationInFirestore(position);
      }, onError: (dynamic error) {
        print('Error obtaining location: $error');
      });
    }
  }

  static void _storeLocationInFirestore(Position position) {
    final _locationCollection =
        FirebaseFirestore.instance.collection('user_locations');

    final userId = FirebaseAuth.instance.currentUser?.uid;

    _locationCollection.doc(userId).collection('location_history').add({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': FieldValue.serverTimestamp(),
    }).catchError((error) {
      print('Error storing location data: $error');
    });
  }
}

Future<void> _onStart() async {
  print('Executing onStart');
  BackgroundService.flutterLocalNotificationsPlugin.show(
    BackgroundService.notificationId,
    'AWESOME SERVICE',
    'Service is running...',
    const NotificationDetails(
      android: AndroidNotificationDetails(
        BackgroundService.notificationChannelId,
        'AWESOME SERVICE',
      ),
    ),
  );
  BackgroundService.start();
}
