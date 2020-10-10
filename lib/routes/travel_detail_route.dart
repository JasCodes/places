import 'package:flutter/material.dart';
import 'package:places/pages/travel_detail_page.dart';

final Route travelDetailRoute = PageRouteBuilder(
  pageBuilder: (context, animation, animationSecondary) {
    return TravelDetailPage();
  },
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return child;
  },
);
