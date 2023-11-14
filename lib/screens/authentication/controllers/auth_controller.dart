import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../models/employee.dart';
import '../exceptions/exceptions.dart';
import '../login_screen.dart';
import '../../home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<firebase_auth.User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<firebase_auth.User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(
      firebaseUser,
      _setInitialScreen,
    );
  }

  Future<void> loginWithCredentials({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      final err = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      Get.snackbar(
        "Error",
        err.message,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } catch (_) {
      const err = LogInWithEmailAndPasswordFailure();
      Get.snackbar(
        "Error",
        err.message,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    }
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
    } on Exception {
      const message = 'An unknown exception occurred.';
      Get.snackbar(
        "Error",
        message,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _setInitialScreen(firebase_auth.User? user) async {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
      return;
    }

    final documentSnapshot = await db
        .collection('employees')
        .doc(
          user.uid,
        )
        .get();

    if (!documentSnapshot.exists) {
      Get.offAll(() => const LoginScreen());
      return;
    }

    final doc = documentSnapshot.data();
    final employee = Employee.fromJson(doc!);

    if (user.email != employee.email) {
      Get.offAll(() => const LoginScreen());
      return;
    }

    Get.offAll(() => const HomeScreen());
  }

  @override
  void onClose() {
    super.onClose();
    firebaseUser.close();
  }
}

AuthController authController = AuthController.instance;
