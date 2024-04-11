import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_back_button.dart';
import 'first_aid_grid_widget.dart';
import 'first_aid_viewmodel.dart';

class FirstAidView extends StackedView<FirstAidViewModel> {
  const FirstAidView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Aid'),
        titleTextStyle: context.appBarTitleStyle,
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Easy and simple First Aid help in case of emergencies.',
              style: context.subtitleStyle,
            ),
            10.verticalSpace,
            if (viewModel.dataReady && viewModel.data!.isNotEmpty)
              const FirstAidGridWidget(),
          ],
        ),
      ),
    );
  }

  @override
  FirstAidViewModel viewModelBuilder(context) => FirstAidViewModel();
}
