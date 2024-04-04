import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:rescue_me/app/app.locator.dart';
import 'package:rescue_me/core/errors/cloud_error.dart';
import 'package:rescue_me/models/emergency_status.dart';
import 'package:rescue_me/models/incident.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/services/auth_service.dart';
import 'package:rescue_me/services/media_service.dart';
import 'package:rescue_me/services/network_service.dart';
import 'package:stacked/stacked.dart';

import '../models/incident_filter.dart';

class IncidentService with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _networkService = locator<NetworkService>();
  final _mediaService = locator<MediaService>();

  User? get user => _authService.user;

  Future<List<Incident?>> getMyResolvedIncidents() async {
    final result = await FirebaseFirestore.instance
        .collection('incidents')
        .where('creator.uid', isEqualTo: user!.uid)
        .where('status', isEqualTo: 'resolved')
        .get();
    final list = result.docs.map((e) => Incident.fromJson(e.data())).toList();
    return list;
  }

  Stream<List<Incident?>> getIncidents(IncidentFilter filter) async* {
    final ref = FirebaseFirestore.instance.collection('incidents');
    switch (filter) {
      case IncidentFilter.myPending:
        yield* ref
            .where('creator.uid', isEqualTo: user!.uid)
            .where('status', isEqualTo: 'pending')
            .snapshots()
            .map(mapStreamList);
      case IncidentFilter.myResolved:
        yield* ref
            .where('creator.uid', isEqualTo: user!.uid)
            .where('status', isEqualTo: 'resolved')
            .snapshots()
            .map(mapStreamList);
      default:
        yield* ref
            .orderBy('createdAt', descending: true)
            .where('status', isEqualTo: 'pending')
            .snapshots()
            .map(mapStreamList);
    }
  }

  List<Incident?> mapStreamList(QuerySnapshot<Map<String, dynamic>> s) {
    return s.docs.map((e) => Incident.fromJson(e.data())).toList();
  }

  Stream<List<Incident?>> get incidentsStream async* {
    yield* FirebaseFirestore.instance
        .collection('incidents')
        .orderBy('createdAt', descending: true)
        .where('status', isEqualTo: 'pending')
        .snapshots()
        .map((s) => s.docs.map((e) => Incident.fromJson(e.data())).toList());
  }

  Future<Either<CloudError, Unit>> createIncident(Incident incident) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }

    try {
      await incidentsRef.doc(incident.uid).set(incident);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<Either<CloudError, Unit>> resolveIncident(Incident incident) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }

    try {
      await incidentsRef
          .doc(incident.uid)
          .set(incident.copyWith(status: EmergencyStatus.resolved));
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<Either<CloudError, Unit>> unResolveIncident(Incident incident) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const CloudError.noNetworkConnection());
    }

    try {
      await incidentsRef
          .doc(incident.uid)
          .set(incident.copyWith(status: EmergencyStatus.pending));
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }

  Future<Either<CloudError, Unit>> deleteIncident(Incident incident) async {
    try {
      final ref = incidentsRef.doc(incident.uid);
      await ref.delete().then((_) async {
        if (incident.photoUrls.isNotEmpty) {
          for (var i = 0; i < incident.photoUrls.length; i++) {
            final fileName = '${incident.uid}+$i.jpg';
            final path = 'images/incidents/${incident.uid}/$fileName';
            await _mediaService.storageRef.child(path).delete();
          }
        }
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(CloudError.error(e.message));
    } on Exception {
      return left(const CloudError.serverError());
    }
  }
}
