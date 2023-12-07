import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_providers.g.dart';

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef _) => FirebaseAuth.instance;

@riverpod
FirebaseFirestore firestore(FirestoreRef _) => FirebaseFirestore.instance;
