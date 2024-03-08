import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_contact.freezed.dart';
part 'emergency_contact.g.dart';

@Collection<EmergencyContact>('emergency_contacts')
final emergencyContactsRef = EmergencyContactCollectionReference();

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

enum EmergencyContactType {
  police,
  ambulance,
  fire,
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
