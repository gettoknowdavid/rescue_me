enum IncidentFilter { latest, myResolved, myPending }

extension IncidentFilterX on IncidentFilter {
  String get name => switch (this) {
        IncidentFilter.latest => 'Latest',
        IncidentFilter.myPending => 'My Pending',
        IncidentFilter.myResolved => 'My Resolved',
      };
}
