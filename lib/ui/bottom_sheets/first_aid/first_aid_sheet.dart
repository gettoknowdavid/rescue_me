import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/first_aid.dart';
import '../../widgets/bullet_list.dart';
import 'first_aid_sheet_model.dart';
import 'first_aid_title_widget.dart';
import 'first_aid_video_widget.dart';

class FirstAidSheet extends StackedView<FirstAidSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const FirstAidSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    final colorScheme = Theme.of(context).colorScheme;

    final firstAid = request.data! as FirstAid;

    return ColoredBox(
      color: colorScheme.background,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            FirstAidTitleWidget(firstAid: firstAid),
            8.verticalSpace,
            Text(firstAid.description, style: context.firstAidSubtitle),
            8.verticalSpace,
            const Divider(),
            FirstAidVideoWidget(url: firstAid.videoURL),
            16.verticalSpace,
            BulletList(title: 'Steps To Administer:', items: firstAid.steps),
            16.verticalSpace,
            BulletList(title: 'Avoid These:', items: firstAid.avoid),
            16.verticalSpace,
            BulletList(title: 'Signs & Symptoms:', items: firstAid.symptoms),
            16.verticalSpace,
            Text('Please note:', style: context.firstAidItemTitle),
            5.verticalSpace,
            Text(firstAid.note!, style: context.firstAidSubtitle),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  FirstAidSheetModel viewModelBuilder(context) => FirstAidSheetModel();
}
