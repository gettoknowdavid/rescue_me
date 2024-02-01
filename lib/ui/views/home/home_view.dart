import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/help_button.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.location_pin),
        title: const Text('Location Permission'),
        titleSpacing: 0,
        actions: [
          Switch(value: true, onChanged: (value) {}),
          16.horizontalSpace,
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'I Need Some Assistance',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.15,
                ),
              ),
              8.verticalSpace,
              Text(
                'Press the button for 3 seconds to get help',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              30.verticalSpace,
              HelpButton(radius: constraints.maxWidth * 0.26),
              30.verticalSpace,
              Text(
                'Send a message',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 26.sp,
                ),
              ),
              4.verticalSpace,
              Text(
                'Ask for help by sending an automated message',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              30.verticalSpace,
              ElevatedButton(
                onPressed: viewModel.goToOnboarding,
                child: const Text('Skip for now'),
              ),
              30.verticalSpace,
            ],
          ),
        );
      }),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
