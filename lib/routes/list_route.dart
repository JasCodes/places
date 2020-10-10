import 'package:flutter/material.dart';
import 'package:places/pages/list_page.dart';

final Route listRoute = PageRouteBuilder(
  pageBuilder: (context, animation, animationSecondary) {
    return ListPage();
  },
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return child;
  },
);
