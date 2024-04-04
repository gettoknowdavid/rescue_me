import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me/models/incident_filter.dart';
import 'package:rescue_me/ui/views/incidents/incidents_viewmodel.dart';
import 'package:stacked/stacked.dart';

class IncidentFilterButton extends ViewModelWidget<IncidentsViewModel> {
  const IncidentFilterButton({super.key});

  @override
  Widget build(BuildContext context, IncidentsViewModel viewModel) {
    return SegmentedButton<IncidentFilter>(
      showSelectedIcon: false,
      onSelectionChanged: viewModel.setFilter,
      style: ButtonStyle(
        iconSize: MaterialStatePropertyAll(16.r),
        textStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.labelSmall,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStatePropertyAll(
          const EdgeInsets.fromLTRB(12, 0, 12, 0).r,
        ),
      ),
      segments: IncidentFilter.values
          .map((e) => ButtonSegment(value: e, label: Text(e.name)))
          .toList(),
      selected: <IncidentFilter>{viewModel.filter},
    );
  }
}
