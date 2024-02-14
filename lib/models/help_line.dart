import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_line.freezed.dart';
part 'help_line.g.dart';

@Freezed(fromJson: false)
@JsonSerializable(converters: firestoreJsonConverters, includeIfNull: false)
class HelpLine with _$HelpLine {
  const factory HelpLine({
    required String uid,
    required String title,
    required String subtitle,
    String? imageUrl,
    
  }) = _HelpLine;

  factory HelpLine.fromJson(Map<String, dynamic> json) =>
      _$HelpLineFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HelpLineToJson(this);
}

@Collection<HelpLine>('helplines')
final helplinesRef = HelpLineCollectionReference();
