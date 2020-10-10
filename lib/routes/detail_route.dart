import 'package:flutter/material.dart';
import 'package:places/pages/detail_page.dart';

final Route detailRoute = PageRouteBuilder(
  pageBuilder: (context, animation, animationSecondary) {
    return DetailPage();
  },
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return child;
  },
);
