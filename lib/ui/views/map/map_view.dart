import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:rescue_me/ui/common/app_styles.dart';
import 'package:rescue_me/ui/widgets/app_back_button.dart';
import 'package:rescue_me/ui/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  const MapView({super.key, required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        titleTextStyle: context.appBarTitleStyle,
        leading: const AppBackButton(),
      ),
      body: OSMFlutter(
        controller: viewModel.controller,
        mapIsLoading: const LoadingWidget(size: WidgetSize.xLarge),
        osmOption: OSMOption(zoomOption: viewModel.zoomOption),
        onMapIsReady: viewModel.mapIsReady,
        onGeoPointClicked: viewModel.onGeoPointClicked,
      ),
    );
  }

  @override
  MapViewModel viewModelBuilder(context) => MapViewModel();
}
