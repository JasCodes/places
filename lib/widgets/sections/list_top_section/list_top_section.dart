import 'package:flutter/material.dart';
import 'package:places/widgets/sections/list_top_section/list_app_bar_section.dart';
import 'package:places/widgets/sections/list_top_section/list_search_section.dart';

class ListTopSection extends StatelessWidget {
  const ListTopSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        child: Column(
          children: [
            ListAppBarSection(),
            SizedBox(height: 20),
            ListSearchSection(),
          ],
        ));
  }
}
