// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authHash() => r'd5cd067037cc1cc565eb3fd6d93d8e82a9d81238';

/// See also [auth].
@ProviderFor(auth)
final authProvider = AutoDisposeProvider<FirebaseAuth>.internal(
  auth,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String _$firestoreHash() => r'e3d9f62f278d3c8456ea4b3a58f1a1193c9c8998';

/// See also [firestore].
@ProviderFor(firestore)
final firestoreProvider = AutoDisposeProvider<FirebaseFirestore>.internal(
  firestore,
  name: r'firestoreProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirestoreRef = AutoDisposeProviderRef<FirebaseFirestore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
