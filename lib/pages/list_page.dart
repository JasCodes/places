import 'package:flutter/material.dart';
import 'package:places/routes/list_route.dart';
import 'package:places/widgets/layouts/list/app_bar_x/_.dart';
import 'package:places/widgets/layouts/list/card_list_view/_.dart';
import 'package:places/widgets/layouts/list/list_search_section.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/list';
  static final route = listRoute;

  const ListPage({Key key}) : super(key: key);

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
                  AppBarX(),
                  SizedBox(height: 20),
                  ListSearchSection(),
                ],
              ),
            ),
            Container(
              height: 500,
              child: CardListView(
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
