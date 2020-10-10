import 'package:flutter/material.dart';
import 'package:places/routes/travel_list_route.dart';
import 'package:places/widgets/sections/list_bottom_section.dart';
import 'package:places/widgets/sections/list_top_section/list_top_section.dart';

class TravelListPage extends StatelessWidget {
  static const routeName = '/list';
  static final route = travelListRoute;

  const TravelListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTopSection(),
            ListBottomSection(),
          ],
        ),
      ),
    );
  }
}
