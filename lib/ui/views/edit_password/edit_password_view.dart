import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'edit_password_viewmodel.dart';

class EditPasswordView extends StackedView<EditPasswordViewModel> {
  const EditPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  EditPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditPasswordViewModel();
}
