import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final double width;
  final double height;
  final Function onTap;
  const Menu({
    Key key,
    @required this.width,
    @required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildLine(double fraction) => Container(
          width: width * fraction,
          height: 2,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.black,
        );

    buildMenu() => Container(
          width: width,
          height: height,
          // color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLine(1),
              buildLine(0.5),
              buildLine(1),
            ],
          ),
        );
    return GestureDetector(
      child: buildMenu(),
      onTap: onTap,
    );
  }
}
