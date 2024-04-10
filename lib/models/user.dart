import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:freezed_annotation/freezed_annotation.dart';

import 'emergency_status.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Collection<User>('users')
@Collection<EmergencyContact>('users/*/emergency_contacts')
@Collection<EmergencyReport>('users/*/emergency_reports')
@Collection<Notification>('users/*/notifications')
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

@Freezed(fromJson: false)
@JsonSerializable(converters: firestoreJsonConverters, includeIfNull: false)
class EmergencyReport with _$EmergencyReport {
  factory EmergencyReport({
    required String uid,
    required EmergencyStatus status,
    required List<EmergencyContactType> emergencyTypes,
    @FirestoreDateTimeConverter() required DateTime createdAt,
    @FirestoreDateTimeConverter() DateTime? closedAt,
    @FirestoreGeoPointConverter() required GeoPoint location,
    String? description,
    List<String?>? imageUrls,
    int? batteryPercentage,
    dynamic creator,
  }) = _EmergencyReport;

  factory EmergencyReport.fromJson(Map<String, dynamic> json) =>
      _$EmergencyReportFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmergencyReportToJson(this);
}

@Freezed(fromJson: false)
@JsonSerializable(converters: firestoreJsonConverters, includeIfNull: false)
class EmergencyContact with _$EmergencyContact {
  factory EmergencyContact({
    required String uid,
    required String name,
    required String phone,
    required EmergencyContactType type,
    required bool isPriority,
    String? email,
    String? imageUrl,
    @Default(false) bool pinned,
  }) = _EmergencyContact;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EmergencyContactToJson(this);
}

@Freezed(fromJson: false)
@JsonSerializable(converters: firestoreJsonConverters, includeIfNull: false)
class Notification with _$Notification {
  factory Notification({
    required String uid,
    required String title,
    String? specialMessage,
    required String sosId,
    required String recipientId,
    required String recipientName,
    required String recipientPhone,
    String? recipientPhotoURL,
    required DateTime createdAt,
    @Default(false) bool read,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}

enum EmergencyContactType {
  ambulance,
  fire,
  police,
  personal,
}

extension EmergencyContactTypeX on EmergencyContactType {
  String get name => switch (this) {
        EmergencyContactType.police => 'Police',
        EmergencyContactType.ambulance => 'Ambulance',
        EmergencyContactType.fire => 'Fire',
        EmergencyContactType.personal => 'Personal',
      };
}
