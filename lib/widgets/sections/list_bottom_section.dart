import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/widgets/components/list_card.dart';

class ListBottomSection extends StatelessWidget {
  const ListBottomSection({Key key}) : super(key: key);
  static const itemCount = 10;
  static const itemExtent = 200.0;
  static const double itemMargin = 20.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      height: 300,
      // width: context.width,
      // color: Colors.blue,
      child: ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        physics: CustomScrollPhysics(
            itemDimension: itemExtent + itemMargin, margin: itemMargin),
        itemBuilder: (context, index) {
          return ListCard(
            index: index,
            count: itemCount,
            laneMargin: itemMargin,
            width: itemExtent,
            height: 400,
          );
        },
        // transformer: PageTransformerBuilder(builder: (widget, transInfo) {}),
      ),
    );
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  final double itemDimension;
  final double margin;

  CustomScrollPhysics({this.itemDimension, this.margin, ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(
        margin: margin,
        itemDimension: itemDimension,
        parent: buildParent(ancestor));
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
