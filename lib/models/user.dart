import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Collection<User>('users')
final usersRef = UserCollectionReference();

@Freezed(fromJson: false)
@JsonSerializable(converters: firestoreJsonConverters, includeIfNull: false)
class User with _$User {
  factory User({
    required String uid,
    required String email,
    required String name,
    String? photoURL,
    String? phoneNumber,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension FirebaseUserX on auth.User {
  User get toUser {
    return User(
      uid: uid,
      email: email!,
      name: displayName!,
      phoneNumber: phoneNumber,
      photoURL: photoURL,
    );
  }
}
