import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rescue_me/models/emergency_status.dart';

part 'incident.freezed.dart';
part 'incident.g.dart';

enum IncidentType { accident, fire, medical, theft, other }

enum IncidentSeverity { low, medium, high }

@Collection<Incident>('incidents')
final incidentsRef = IncidentCollectionReference();

@Freezed(fromJson: false)
@JsonSerializable(converters: firestoreJsonConverters, includeIfNull: false)
class Incident with _$Incident {
  factory Incident({
    required String uid,
    required String title,
    required String address,
    String? description,
    dynamic creator,
    @Default(false) bool anonymous,
    @FirestoreDateTimeConverter() required DateTime createdAt,
    @Default(<String?>[]) List<String?> photoUrls,
    @FirestoreGeoPointConverter() required GeoPoint location,
    required IncidentType type,
    required IncidentSeverity severity,
    required EmergencyStatus status,
    @Default(false) bool isMine,
  }) = _Incident;

  factory Incident.fromJson(Map<String, dynamic> json) =>
      _$IncidentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IncidentToJson(this);
}

extension IncidentSeverityX on IncidentSeverity {
  String get name => switch (this) {
        IncidentSeverity.low => 'Low',
        IncidentSeverity.medium => 'Medium',
        IncidentSeverity.high => 'High',
      };

  Color get color => switch (this) {
        IncidentSeverity.low => Colors.green,
        IncidentSeverity.medium => Colors.amber,
        IncidentSeverity.high => Colors.red,
      };

  Color get onColor => switch (this) {
        IncidentSeverity.medium => Colors.black,
        _ => Colors.white,
      };
}

extension IncidentTypeX on IncidentType {
  String get name => switch (this) {
        IncidentType.accident => 'Accident',
        IncidentType.fire => 'Fire',
        IncidentType.medical => 'Medical',
        IncidentType.other => 'Other',
        IncidentType.theft => 'Theft',
      };
}
