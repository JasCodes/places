import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/data/place_image_data.dart';
import 'package:places/widgets/components/list_card.dart';

class PlaceCardsSection extends StatelessWidget {
  final double itemExtent;
  final double itemMargin;
  const PlaceCardsSection({
    Key key,
    @required this.itemExtent,
    @required this.itemMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = PlaceImageData.list();
    final physics = CustomScrollPhysics(
      itemDimension: itemExtent + itemMargin,
      margin: itemMargin,
    );
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: physics,
        children: list.map((img) {
          return ListCard(
            index: list.indexOf(img),
            img: img,
            count: list.length,
            laneMargin: itemMargin,
            itemExtent: itemExtent,
          );
        }).toList(),
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
