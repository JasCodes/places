import 'package:flutter/material.dart';
import 'package:ext/ext.dart';
import 'package:places/widgets/sections/list_bottom_section.dart';
import 'package:places/widgets/sections/list_top_section.dart';

class TravelList extends StatelessWidget {
  const TravelList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTopSection(),
          ListBottomSection(),
        ],
      ),
    );
  }
}
