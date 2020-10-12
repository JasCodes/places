import 'package:flutter/widgets.dart';

class LeftAlignedScrollPhysics extends ScrollPhysics {
  final double itemExtent;
  final double margin;
  final double itemDimension;

  LeftAlignedScrollPhysics({this.itemExtent, this.margin, ScrollPhysics parent})
      : itemDimension = margin + itemExtent,
        super(parent: parent);

  @override
  LeftAlignedScrollPhysics applyTo(ScrollPhysics ancestor) {
    return LeftAlignedScrollPhysics(
      margin: margin,
      itemExtent: itemExtent,
      parent: buildParent(ancestor),
    );
  }

  double _getPage(ScrollPosition position) {
    return ((position.pixels + margin) / (itemDimension));
  }

  double _getPixels(double page) {
    return (page * itemDimension);
  }

  double _getTargetPixels(
    ScrollPosition position,
    Tolerance tolerance,
    double velocity,
  ) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);

    final Tolerance tolerance = this.tolerance;
    // final portion = (position.extentInside - itemDimension) / 2;

    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
