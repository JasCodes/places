import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:places/models/places_model.dart';
import 'package:places/routes/detail_route.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = '/detail';
  static final route = detailRoute;

  final PlacesModel place;

  const DetailPage({
    Key key,
    this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailRouteProps props = Get.find();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('TravelDetailPage'),
      ),
      body: Container(
        height: 300,
        width: 500,
        child: AnimatedBuilder(
          child: place.images[0].image(
            fit: BoxFit.cover,
          ),
          animation: props.animation,
          builder: (context, child) {
            return Opacity(
              opacity: props.animation.value == 1 ? 1 : 0,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
