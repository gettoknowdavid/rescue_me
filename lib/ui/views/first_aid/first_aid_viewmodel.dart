import 'package:rescue_me/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../models/first_aid.dart';
import '../../../services/first_aid_service.dart';

class FirstAidViewModel extends FutureViewModel<List<FirstAid>> {
  final _firstAidService = locator<FirstAidService>();
  final _bottomSheetService = locator<BottomSheetService>();

  Future<void> showDetails(FirstAid firstAid) async {
    await _bottomSheetService.showCustomSheet<void, FirstAid>(
      variant: BottomSheetType.firstAid,
      takesInput: true,
      useRootNavigator: true,
      isScrollControlled: true,
      data: firstAid,
    );
  }

  @override
  Future<List<FirstAid>> futureToRun() => _firstAidService.getFirstAids;
}
