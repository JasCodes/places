import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/controllers/places_controller.dart';

class GlobalControllers extends StatelessWidget {
  final Widget child;
  const GlobalControllers({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PlacesController());
    return child;
  }
}
