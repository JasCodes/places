import 'package:flutter/material.dart';

class ListAppBarSection extends StatelessWidget {
  const ListAppBarSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.menu),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          width: 45,
          height: 45,
        ),
      ],
    );
  }
}
