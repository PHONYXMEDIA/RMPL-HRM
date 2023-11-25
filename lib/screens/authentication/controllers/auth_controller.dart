import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmpl_hrm/models/employee.dart';

import '../../../constants/constants.dart';
import '../../home_screen.dart';
import '../exceptions/exceptions.dart';
import '../login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<firebase_auth.User?> firebaseUser;
  Rx<Employee?> employee = Rx<Employee?>(null);

  @override
  void onReady() {
    firebaseUser = Rx<firebase_auth.User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(
      firebaseUser,
      _setInitialScreen,
    );
    super.onReady();
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

    final doc = await FirebaseFirestore.instance
        .collection("employees")
        .doc(user.uid)
        .get();

    final employee = Employee.fromJson(doc.data() as Map<String, dynamic>);

    this.employee.trigger(employee);

    if (user.email != employee.email) {
      await logOut();
      Get.offAll(() => const LoginScreen());
      Get.snackbar(
        "Error",
        "The email address is not associated with the employee",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
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
