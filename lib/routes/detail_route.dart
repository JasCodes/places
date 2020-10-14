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
      // transitionDuration: 1.seconds,
      // reverseTransitionDuration: 1.seconds,
      pageBuilder: (context, animation, animationSecondary) {
        Get.delete<DetailRouteProps>();
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
