import 'package:flutter/material.dart';
import 'package:places/widgets/customs/shadow_tree/shadow_target_builder.dart';

class CardView extends StatelessWidget {
  final Image img;
  final double itemExtent;
  final double borderRadius;
  const CardView({
    Key key,
    @required this.img,
    @required this.itemExtent,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _borderRadius = borderRadius ?? 10;

    return ShadowTargetBuilder(
      active: false,
      builder: (context) {
        return Container(
          width: itemExtent,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: img,
        );
      },
    );
  }
}
