import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/widgets/customs/left_aligned_list_view/left_aligned_scroll_physics.dart';

class LeftAlignedListView extends StatelessWidget {
  final List<Widget> children;
  final double itemExtent;
  final double laneMargin;
  final double edgeMargin;

  const LeftAlignedListView({
    Key key,
    @required this.children,
    @required this.itemExtent,
    this.laneMargin,
    this.edgeMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final physics = LeftAlignedScrollPhysics(
      itemExtent: itemExtent,
      margin: laneMargin,
    );

    return ListView(
      scrollDirection: Axis.horizontal,
      physics: physics,
      children: children.map((child) {
        int _index = children.indexOf(child);
        double _laneMargin = laneMargin ?? 20;
        double _edgeMargin = (edgeMargin ?? _laneMargin);

        EdgeInsets _mpad = EdgeInsets.zero;
        if (_index == 0) {
          _mpad = EdgeInsets.only(left: _edgeMargin / 2);
        }
        if (_index == children.length - 1) {
          _mpad = EdgeInsets.only(right: _edgeMargin / 2);
        }
        return Padding(
          padding: _mpad,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _laneMargin / 2),
            child: child,
          ),
        );
      }).toList(),
    );
  }
}
