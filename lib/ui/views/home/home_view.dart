import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/section_title.dart';
import 'help_line_list.dart';
import 'home_help_button.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final titleStyle = textTheme.titleMedium?.copyWith(fontSize: 18.sp);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              16.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Text('Hello, ${viewModel.firstName}', style: titleStyle),
              ),
              16.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: HomeHelpButton(onTap: viewModel.futureToRun),
              ),
              16.verticalSpace,
              const HelpLineList(),
              16.verticalSpace,
              const SectionTitle('Emergency Contacts', addPadding: true),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
