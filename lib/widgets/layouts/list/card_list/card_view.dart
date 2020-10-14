import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/models/places_model.dart';
import 'package:places/routes/list_route.dart';
import 'package:ext/ext.dart';
import 'package:places/widgets/customs/shadow/shadow_child.dart';
import 'package:places/widgets/layouts/list/card_list/cart_list_detail_transition_builder.dart';

import 'package:places/widgets/transitions/@transitions.dart';

class CardView extends StatelessWidget {
  final PlacesModel place;
  final Rx<PlacesModel> activePlace;
  final double borderRadius;
  final globalKey = GlobalKey().obs;
  final ListRouteProps props = Get.find();
  final isShadow = false.obs;

  isNavigatingOut() =>
      props.animNavOut.status == AnimationStatus.forward ||
      props.animNavOut.status == AnimationStatus.reverse;

  CardView({
    Key key,
    @required this.place,
    @required this.activePlace,
    this.borderRadius,
  }) : super(key: key) {
    if (activePlace.value == place) {
      isShadow.value = isNavigatingOut();
      props.animNavOut.addStatusListener((status) {
        isShadow.value = isNavigatingOut();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double _borderRadius = borderRadius ?? 20;
    return Obx(
      () => ShadowChild(
        zIndex: 0,
        key: globalKey.value,
        active: isShadow.value,
        builder: (context) {
          return place.images[0]
              .image(fit: BoxFit.cover)
              .circularBorderRadiusTransition(
                props.animNavOut,
                enabled: activePlace.value == place,
              );
        },
        renderBuilder: cardListDetailTransitionBuilder,
      ),
    );
  }
}
