import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:places/models/places_model.dart';
import 'package:places/routes/detail_route.dart';
import 'package:ext/ext.dart';

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
      body: Container(
        child: AnimatedBuilder(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: place.images[0].image(
              fit: BoxFit.cover,
              height: context.height * 0.6,
              width: double.infinity,
            ),
          ),
          animation: props.animation,
          builder: (context, child) {
            // print(props.animation.value);
            // print(props.animation.value == 1 ? 1 : 0);
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
