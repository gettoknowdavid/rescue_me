import 'package:flutter/material.dart';

class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;
  final Color secondaryColor;
  final String route;

  DashboardItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.secondaryColor,
    required this.route,
  });
}
