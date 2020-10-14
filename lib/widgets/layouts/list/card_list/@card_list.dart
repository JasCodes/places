import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/controllers/places_controller.dart';
import 'package:places/models/places_model.dart';
import 'package:places/pages/detail_page.dart';
import 'package:places/widgets/customs/left_aligned_list_view/@left_aligned_list_view.dart';
import 'package:places/widgets/layouts/list/card_list/card_view.dart';

class CardList extends StatelessWidget {
  CardList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlacesController placesController = Get.find();
    final places = placesController.places;
    final Rx<PlacesModel> activePlace = places.first.obs;

    return LeftAlignedListView(
      itemExtent: 250,
      laneMargin: 20,
      children: places.map((place) {
        return GestureDetector(
          onTap: () {
            activePlace.value = place;
            Navigator.of(context).pushNamed(
              DetailPage.routeName,
              arguments: place,
            );
          },
          child: Obx(
            () => CardView(
              place: place,
              activePlace: activePlace,
            ),
          ),
        );
      }).toList(),
    );
  }
}
