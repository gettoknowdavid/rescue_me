import 'package:stacked/stacked.dart';

import '../models/help_line.dart';

class CloudStoreService with ListenableServiceMixin {
  Future<List<HelpLine?>> getHelplines() async {
    final result = await helplinesRef.get();
    return result.docs.map((e) => e.data).toList();
  }
}
