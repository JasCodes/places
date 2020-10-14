import 'package:flutter/material.dart';

class CircularBorderRadiusTransition extends StatelessWidget {
  final Animation animation;
  final double begin;
  final double end;
  final Widget child;
  const CircularBorderRadiusTransition({
    Key key,
    @required this.animation,
    @required this.child,
    this.begin = 20,
    this.end = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final _animBorderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(begin),
          end: BorderRadius.circular(end),
        ).animate(animation);

        return ClipRRect(
          borderRadius: _animBorderRadius.value,
          child: child,
        );
      },
    );
  }
}
