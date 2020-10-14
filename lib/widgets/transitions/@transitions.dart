import 'package:flutter/widgets.dart';
import 'package:places/widgets/transitions/circular_border_radius_transition.dart';

extension Transitions on Widget {
  Widget circularBorderRadiusTransition(
    Animation animation, {
    double begin = 20,
    double end = 0,
    bool enabled = true,
  }) {
    return CircularBorderRadiusTransition(
      child: this,
      animation: animation,
      begin: begin,
      end: enabled ? end : begin,
    );
  }
}
