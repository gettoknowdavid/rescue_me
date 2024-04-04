import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/incident.dart';
import 'package:rescue_me/ui/views/incidents/incidents_viewmodel.dart';
import 'package:stacked/stacked.dart';

final _smoothBorderRadius = SmoothBorderRadius.all(
  SmoothRadius(
    cornerRadius: 20.r,
    cornerSmoothing: 1,
  ),
);

class IncidentCard extends ViewModelWidget<IncidentsViewModel> {
  const IncidentCard({super.key, required this.incident});
  final Incident incident;

  @override
  Widget build(BuildContext context, IncidentsViewModel viewModel) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final hasPhotos = incident.photoUrls.isNotEmpty;

    return InkWell(
      onTap: () => viewModel.goToAddIncidentDetails(incident),
      borderRadius: _smoothBorderRadius,
      child: Card(
        borderOnForeground: true,
        elevation: 8,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: _smoothBorderRadius,
          side: BorderSide(color: colorScheme.primaryContainer),
        ),
        child: Dismissible(
          key: ObjectKey(incident),
          direction: DismissDirection.endToStart,
          background: Container(
            color: colorScheme.error,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16).r,
            child: Icon(PhosphorIconsFill.trash, color: colorScheme.onError),
          ),
          onDismissed: (_) => viewModel.deleteIncident(incident),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Image(url: hasPhotos ? incident.photoUrls[0] : null),
              8.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      incident.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.r,
                      ),
                    ),
                    4.verticalSpace,
                    _Location(incident: incident),
                    12.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      height: 0.4.sw,
      width: 1.sw,
      child: Stack(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: _smoothBorderRadius,
              image: url != null
                  ? DecorationImage(
                      image: NetworkImage(url!), fit: BoxFit.cover)
                  : null,
            ),
            child: url == null
                ? const Center(child: Icon(PhosphorIconsRegular.image))
                : null,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 6, 10, 6).r,
            child: Text(
              'Created by You',
              style: textTheme.labelSmall?.copyWith(
                fontSize: 10.r,
                color: colorScheme.onSurface.withOpacity(0.3),
                letterSpacing: -0.5.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Location extends ViewModelWidget<IncidentsViewModel> {
  const _Location({required this.incident});
  final Incident incident;

  @override
  Widget build(BuildContext context, IncidentsViewModel viewModel) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final dimColor = colorScheme.onBackground.withOpacity(0.5);

    return Row(
      children: [
        Icon(
          PhosphorIconsRegular.mapPin,
          size: 14.r,
          color: dimColor,
        ),
        4.horizontalSpace,
        Text(
          incident.address,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.labelSmall?.copyWith(color: dimColor),
        ),
      ],
    );
  }
}
