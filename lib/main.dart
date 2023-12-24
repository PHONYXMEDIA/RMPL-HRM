import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/features/app/app.dart';
import 'package:rmpl_hrm/features/geolocation/view/background_service.dart';
import 'package:rmpl_hrm/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

late Size mq;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background message
  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // BackgroundService.start();
  await initializeService();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Handling a foreground message: ${message.messageId}");
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
