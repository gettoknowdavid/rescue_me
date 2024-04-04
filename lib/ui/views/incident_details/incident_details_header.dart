import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/ui/views/incident_details/incident_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

final _carouselController = CarouselController();

class IncidentDetailsHeader extends ViewModelWidget<IncidentDetailsViewModel> {
  const IncidentDetailsHeader({super.key});

  @override
  Widget build(BuildContext context, IncidentDetailsViewModel viewModel) {
    final theme = Theme.of(context);

    Widget? background;

    if (viewModel.incident.photoUrls.isEmpty) {
      background = Container(
        color: theme.primaryColor.withOpacity(0.5),
        child: const Icon(PhosphorIconsRegular.image),
      );
    } else {
      background = const Stack(
        alignment: Alignment.bottomCenter,
        children: [_Carousel(), _Dots()],
      );
    }

    return FlexibleSpaceBar(background: background);
  }
}

class _Carousel extends ViewModelWidget<IncidentDetailsViewModel> {
  const _Carousel();

  @override
  Widget build(BuildContext context, IncidentDetailsViewModel viewModel) {
    final urls = viewModel.incident.photoUrls;
    List<Widget> items = [];

    if (urls.isEmpty) {
      return const SizedBox();
    }

    final length = urls.length;

    for (var i = 0; i < length; i++) {
      items.add(Image.network(
        urls[i]!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return const Center(child: CircularProgressIndicator());
        },
      ));
    }

    return CarouselSlider(
      items: items,
      carouselController: _carouselController,
      options: CarouselOptions(
        viewportFraction: 1,
        height: 0.32.sh,
        onPageChanged: (index, reason) => viewModel.setPhotoIndex(index),
      ),
    );
  }
}

class _Dots extends ViewModelWidget<IncidentDetailsViewModel> {
  const _Dots();

  @override
  Widget build(BuildContext context, IncidentDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3).r,
        color: isDark ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: viewModel.incident.photoUrls.asMap().entries.map((entry) {
            return Container(
              width: 6.r,
              height: 6.r,
              margin: const EdgeInsets.symmetric(horizontal: 4).r,
              decoration: BoxDecoration(
                color: viewModel.currentImageIndex == entry.key
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
