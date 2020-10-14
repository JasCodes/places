import 'package:flutter/material.dart';
import 'package:places/routes/list_route.dart';
import 'package:places/widgets/customs/shadow/@shadow.dart';
import 'package:places/widgets/layouts/list/app_bar_x/@app_bar_x.dart';
import 'package:places/widgets/layouts/list/card_list/@card_list.dart';
import 'package:places/widgets/layouts/list/card_search/@card_search.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/list';
  static final route = listRoute;

  const ListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Shadow(
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
                    CardSearch(),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: CardList(
                    // children: PlacesImageData.list(),
                    // itemExtent: 220,
                    // laneMargin: 20,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
