import 'package:flutter/material.dart';

class CardPlaces extends StatelessWidget {
  final Image img;
  final double itemExtent;
  final int index;
  final int count;
  final double laneMargin;
  final double edgeMargin;
  final double borderRadius;
  const CardPlaces({
    Key key,
    @required this.img,
    @required this.itemExtent,
    @required this.index,
    @required this.count,
    @required this.laneMargin,
    this.edgeMargin,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _edgeMargin = (edgeMargin ?? laneMargin) / 2;
    double _laneMargin = laneMargin / 2;
    double _borderRadius = borderRadius ?? 10;
    EdgeInsets mpad = EdgeInsets.zero;
    if (index == 0) {
      mpad = EdgeInsets.only(left: _edgeMargin);
    }
    if (index == count - 1) {
      mpad = EdgeInsets.only(right: _edgeMargin);
    }

    return Padding(
      padding: mpad,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _laneMargin),
        child: Container(
          width: itemExtent,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: img,
        ),
      ),
    );
  }
}
