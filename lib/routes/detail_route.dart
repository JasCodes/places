import 'package:flutter/material.dart';
import 'package:places/pages/detail_page.dart';
import 'package:ext/ext.dart';

class DetailRouteProps {
  final Animation<double> animation;
  final Animation<double> animationSecondary;
  DetailRouteProps(
    this.animation,
    this.animationSecondary,
  );
}

detailRoute({Object args}) => PageRouteBuilder(
      transitionDuration: 5.seconds,
      reverseTransitionDuration: 5.seconds,
      pageBuilder: (context, animation, animationSecondary) {
        Get.put(
          DetailRouteProps(animation, animationSecondary),
        );

        return DetailPage(
          place: args,
        );
      },
      // transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //   return child;
      // },
    );
