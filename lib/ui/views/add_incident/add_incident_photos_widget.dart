import 'package:carousel_slider/carousel_slider.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/views/add_incident/add_incident_viewmodel.dart';
import 'package:stacked/stacked.dart';

final _borderRadius = SmoothBorderRadius(
  cornerRadius: 20.r,
  cornerSmoothing: 1,
);

class AddIncidentPhotosWidget extends ViewModelWidget<AddIncidentViewModel> {
  const AddIncidentPhotosWidget({super.key});

  @override
  Widget build(BuildContext context, AddIncidentViewModel viewModel) {
    final theme = Theme.of(context);

    return Column(
      children: [
        InkWell(
          onTap: viewModel.getImages,
          borderRadius: _borderRadius,
          child: Container(
            height: 0.26.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceVariant,
              borderRadius: SmoothBorderRadius(
                cornerRadius: 20.r,
                cornerSmoothing: 1,
              ),
            ),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                _Carousel(),
                _Dots(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton.icon(
            onPressed: viewModel.getImages,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0).r,
              textStyle: theme.textTheme.bodySmall,
            ),
            icon: PhosphorIcon(PhosphorIconsRegular.camera, size: 16.r),
            label: Text(
              viewModel.images.isNotEmpty ? 'Change Photos' : 'Select Photos',
            ),
          ),
        ),
      ],
    );
  }
}

class _Carousel extends ViewModelWidget<AddIncidentViewModel> {
  const _Carousel();

  @override
  Widget build(BuildContext context, AddIncidentViewModel viewModel) {
    final carouselController = CarouselController();

    final images = viewModel.editing ? viewModel.photoUrls : viewModel.images;
    List<Widget> items = [];

    if (images.isEmpty) {
      return const SizedBox();
    }

    final length = images.length;

    for (var i = 0; i < length; i++) {
      items.add(Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2).r,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          image: viewModel.editing
              ? DecorationImage(
                  image: NetworkImage(viewModel.photoUrls[i]!),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  image: FileImage(viewModel.images[i]!),
                  fit: BoxFit.cover,
                ),
        ),
      ));
    }

    return CarouselSlider(
      items: items,
      carouselController: carouselController,
      options: CarouselOptions(
        viewportFraction: 1,
        onPageChanged: (index, reason) => viewModel.setPhotoIndex(index),
      ),
    );
  }
}

class _Dots extends ViewModelWidget<AddIncidentViewModel> {
  const _Dots();

  @override
  Widget build(BuildContext context, AddIncidentViewModel viewModel) {
    final theme = Theme.of(context);

    if (viewModel.images.isEmpty && !viewModel.editing) {
      return const SizedBox();
    }

    final images = viewModel.editing ? viewModel.photoUrls : viewModel.images;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: images.asMap().entries.map((entry) {
            return Container(
              width: 4.r,
              height: 4.r,
              margin: const EdgeInsets.symmetric(horizontal: 4).r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: viewModel.currentIndex == entry.key
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.primary,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
