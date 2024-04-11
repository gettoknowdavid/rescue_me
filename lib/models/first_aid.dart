import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'first_aid.freezed.dart';
part 'first_aid.g.dart';

@Collection<FirstAid>('first_aids')
final firstAidRef = FirstAidCollectionReference();

@Freezed(fromJson: false)
@JsonSerializable(converters: firestoreJsonConverters, includeIfNull: false)
class FirstAid with _$FirstAid {
  factory FirstAid({
    required String uid,
    required String title,
    required String description,
    required String featuredImageURL,
    required String videoURL,
    required List<String> steps,
    required List<String> avoid,
    required List<String> symptoms,
    String? note,
  }) = _FirstAid;

  factory FirstAid.fromJson(Map<String, dynamic> json) =>
      _$FirstAidFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FirstAidToJson(this);
}
