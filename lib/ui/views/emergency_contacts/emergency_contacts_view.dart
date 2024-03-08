import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_back_button.dart';
import 'emergency_contacts_list.dart';
import 'emergency_contacts_viewmodel.dart';

class EmergencyContactsView extends StackedView<EMCViewModel> {
  const EmergencyContactsView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts', style: context.appBarTitleStyle),
        leading: const AppBackButton(),
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.refresh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Click on any of the names listed to call the contact. Or tap the + to add a new Emergency Contact.',
                style: context.subtitleStyle,
              ),
              32.verticalSpace,
              const EmergencyContactsList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.goToContactFormView,
        child: const Icon(PhosphorIconsBold.plus),
      ),
    );
  }

  @override
  EMCViewModel viewModelBuilder(context) => EmergencyContactsViewModel();
}
