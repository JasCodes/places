import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:places/controllers/places_controller.dart';
import 'package:places/pages/detail_page.dart';
import 'package:places/widgets/customs/left_aligned_list_view/@left_aligned_list_view.dart';
import 'package:places/widgets/layouts/list/card_list/card_view.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlacesController placesController = Get.find();

    return LeftAlignedListView(
      itemExtent: 200,
      laneMargin: 20,
      children: placesController.places.map((place) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailPage.routeName,
              arguments: place,
            );
          },
          child: CardView(
            img: place.images[0].image(fit: BoxFit.cover),
            itemExtent: 200,
          ),
        );
      }).toList(),
    );
  }
}
