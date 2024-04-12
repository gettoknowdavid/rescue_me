import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_back_button.dart';
import 'about_viewmodel.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About RescueMe'),
        titleTextStyle: context.appBarTitleStyle,
        leading: const AppBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.r,
              width: 120.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/ic_launcher.png'),
                ),
                borderRadius: SmoothBorderRadius.all(
                  SmoothRadius(cornerRadius: 32.r, cornerSmoothing: 1),
                ),
              ),
            ),
            20.verticalSpace,
            const Text(
              'Welcome to RescueMe, your go-to Emergency Mobile App designed to provide essential support and resources during critical moments. Powered by Flutter, RescueMe integrates a range of features to ensure you have the assistance you need at your fingertips.',
            ),
            8.verticalSpace,
            const _Text(
              'One of the standout capabilities of RescueMe is its crowd-sourcing functionality. Users can swiftly upload incident reports, contributing to a community-driven network that enhances situational awareness and aids in effective response coordination.',
            ),
            8.verticalSpace,
            const _Text(
              'Our SOS feature is a vital component of RescueMe, offering immediate communication with your designated emergency contacts directly within the app. While our app currently does not access external maps, this feature ensures that help is notified promptly and efficiently.',
            ),
            8.verticalSpace,
            const _Text(
              'RescueMe simplifies the process of managing emergency contacts by allowing users to store and access them effortlessly. With one-touch calling and messaging, reaching out for help is quick and straightforward.',
            ),
            8.verticalSpace,
            const _Text(
              'In moments where immediate action is necessary, RescueMe provides step-by-step first aid guidance for various common injuries and accidents. From CPR instructions to treating burns, users can access critical information to administer aid effectively.',
            ),
            8.verticalSpace,
            const _Text(
              'Personalization is key, which is why RescueMe offers comprehensive profile management tools. Update your bio, change your email address, modify passwords, and keep contact details current—all within the app.',
            ),
            8.verticalSpace,
            const _Text(
              'To enhance user experience, RescueMe also offers customizable settings such as theme changes, allowing you to personalize the app\'s interface to suit your preferences and needs.',
            ),
            8.verticalSpace,
            const _Text(
              'With RescueMe, our mission is to empower you with the tools and information necessary to handle emergencies confidently. Download RescueMe today and gain peace of mind knowing that assistance is just a tap away. Stay safe, stay prepared with RescueMe.',
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  AboutViewModel viewModelBuilder(context) => AboutViewModel();
}

class _Text extends StatelessWidget {
  const _Text(this.text);
  final String text;

  @override
  Widget build(context) => Text(text, style: context.aboutAppStyle);
}
