import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/pages/list_page.dart';

class ListRouteProps {
  final Animation<double> animation;
  final Animation<double> animationSecondary;
  ListRouteProps(
    this.animation,
    this.animationSecondary,
  );
}

listRoute({Object args}) => PageRouteBuilder(
      pageBuilder: (context, animation, animationSecondary) {
        Get.put(
          ListRouteProps(animation, animationSecondary),
        );

        return ListPage();
      },
      // transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //   return child;
      // },
    );
