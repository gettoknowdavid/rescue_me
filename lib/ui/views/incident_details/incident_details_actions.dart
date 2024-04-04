import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/emergency_status.dart';
import 'package:rescue_me/models/incident.dart';
import 'package:rescue_me/ui/views/incident_details/incident_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class IncidentDetailsActions extends ViewModelWidget<IncidentDetailsViewModel> {
  const IncidentDetailsActions({super.key});

  @override
  Widget build(BuildContext context, IncidentDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final incidentId = viewModel.incident.uid;

    return Wrap(
      spacing: 8.r,
      children: [
        TextButton.icon(
          onPressed: viewModel.editIncident,
          icon: Icon(PhosphorIconsRegular.pencil, size: 16.r),
          style: TextButton.styleFrom(
            foregroundColor: colorScheme.primary,
            backgroundColor: colorScheme.surfaceVariant,
            textStyle: textTheme.bodySmall,
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 4).r,
          ),
          label: const Text('Edit'),
        ),
        FirestoreBuilder(
          ref: incidentsRef.doc(incidentId).select((s) => s.data!.status),
          builder: (context, snapshot, child) {
            final isResolved = snapshot.data == EmergencyStatus.resolved;

            return TextButton.icon(
              onPressed: isResolved
                  ? viewModel.unResolveIncident
                  : viewModel.resolveIncident,
              icon: Icon(
                isResolved
                    ? PhosphorIconsRegular.x
                    : PhosphorIconsRegular.check,
                size: 16.r,
              ),
              style: TextButton.styleFrom(
                foregroundColor: !isResolved ? Colors.green : Colors.amber,
                backgroundColor: colorScheme.surfaceVariant,
                textStyle: textTheme.bodySmall,
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 4).r,
              ),
              label: Text(isResolved ? 'Set as Pending' : 'Set as Resolved'),
            );
          },
        ),
        TextButton.icon(
          onPressed: viewModel.deleteIncident,
          icon: Icon(PhosphorIconsRegular.trash, size: 16.r),
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
            backgroundColor: colorScheme.surfaceVariant,
            textStyle: textTheme.bodySmall,
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 4).r,
          ),
          label: const Text('Delete'),
        )
      ],
    );
  }
}
