import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    String? name,
    String? email,
  }) = _User;

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;
}

extension UserExtension on auth.User {
  User? get toUser {
    return User(
      id: uid,
      name: displayName,
      email: email,
    );
  }
}
