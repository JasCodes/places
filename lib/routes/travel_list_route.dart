import 'package:flutter/material.dart';
import 'package:places/pages/travel_list_page.dart';

final Route travelListRoute = PageRouteBuilder(
  pageBuilder: (context, animation, animationSecondary) {
    return TravelListPage();
  },
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return child;
  },
);
