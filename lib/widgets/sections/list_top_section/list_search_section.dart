import 'package:flutter/material.dart';
import 'package:ext/ext.dart';

class ListSearchSection extends StatelessWidget {
  const ListSearchSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // color: Colors.green,
          // height: 80,
          child: Text(
            "Discover the\nworld in you!",
            style: context.textTheme.headline5,
          ),
        ),
        SizedBox(height: 20),
        Container(color: Colors.green, height: 50),
      ],
    );
  }
}
