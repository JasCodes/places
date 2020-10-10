import 'package:flutter/material.dart';
import 'package:places/routes/travel_list_route.dart';
import 'package:places/widgets/sections/place_list/app_bar_section.dart';

import 'package:places/widgets/sections/place_list/list_bottom_section.dart';
import 'package:places/widgets/sections/place_list/list_search_section.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: Column(
                children: [
                  AppBarSection(),
                  SizedBox(height: 20),
                  ListSearchSection(),
                ],
              ),
            ),
            Container(
              height: 500,
              child: PlaceCardsSection(
                itemExtent: 220,
                itemMargin: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
