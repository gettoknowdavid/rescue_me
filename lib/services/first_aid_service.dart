import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/first_aid.dart';

class FirstAidService {
  Future<List<FirstAid>> get getFirstAids async {
    final cache = await firstAidRef.get(const GetOptions(source: Source.cache));

    if (cache.docs.isNotEmpty) {
      return cache.docs.map((e) => e.data).toList();
    } else {
      final serverAndCache = await firstAidRef.get();
      return serverAndCache.docs.map((e) => e.data).toList();
    }
  }

  Future<FirstAid?> getFirstAid(String uid) async {
    final doc = await firstAidRef.doc(uid).get();
    return doc.data;
  }
}
