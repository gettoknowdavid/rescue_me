import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:rescue_me/models/user.dart';
import 'package:rescue_me/ui/views/incident_details/incident_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreatorSection extends ViewModelWidget<IncidentDetailsViewModel> {
  const CreatorSection({super.key});

  @override
  Widget build(BuildContext context, IncidentDetailsViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final creator = User.fromJson(viewModel.incident.creator);

    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: 54.r,
            width: 54.r,
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(16)).r,
              image: creator.photoURL == null
                  ? null
                  : DecorationImage(
                      image: NetworkImage(creator.photoURL!),
                      fit: BoxFit.cover,
                    ),
            ),
            child: creator.photoURL == null
                ? const PhosphorIcon(PhosphorIconsDuotone.user)
                : null,
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('CREATED BY', style: textTheme.bodySmall),
                Text(
                  creator.name,
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
