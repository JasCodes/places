import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final int index;
  final int count;
  final double laneMargin;
  final double edgeMargin;
  final double width;
  final double height;
  final double borderRadius;
  const ListCard({
    Key key,
    @required this.index,
    @required this.count,
    @required this.width,
    @required this.height,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            color: index % 2 == 0 ? Colors.red : Colors.amber,
          ),
          width: 200,
          height: 400,
        ),
      ),
    );
  }
}
