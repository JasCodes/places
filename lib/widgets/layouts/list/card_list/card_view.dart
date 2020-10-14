import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/models/places_model.dart';
import 'package:places/routes/list_route.dart';
import 'package:places/widgets/customs/shadow_tree/shadow_target_builder.dart';
import 'package:ext/ext.dart';

class CardView extends StatelessWidget {
  final PlacesModel place;
  final bool active;
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
    @required this.active,
    this.borderRadius,
  }) : super(key: key) {
    if (active) {
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
      () => ShadowTargetBuilder(
        key: globalKey.value,
        active: isShadow.value,
        builder: (context) {
          final animBorderRadius = BorderRadiusTween(
            begin: BorderRadius.circular(_borderRadius),
            end: BorderRadius.circular(active ? 0 : _borderRadius),
          ).animate(props.animNavOut);

          return AnimatedBuilder(
            animation: props.animNavOut,
            child: place.images[0].image(
              fit: BoxFit.cover,
            ),
            builder: (context, child) {
              return ClipRRect(
                borderRadius: animBorderRadius.value,
                child: child,
              );
            },
          );
        },
        renderBuilder: (context, shadowContext, child) {
          final RenderBox renderBox = shadowContext.findRenderObject();
          final offset = renderBox.localToGlobal(Offset.zero);

          final offsetAnimation = Tween<Offset>(
            begin: offset,
            end: Offset.zero,
          ).animate(props.animNavOut);

          final animSize = SizeTween(
            begin: renderBox.size,
            end: Size(context.width, context.height * 0.6),
          ).animate(props.animNavOut);

          return AnimatedBuilder(
            animation: props.animNavOut,
            child: child,
            builder: (context, child) {
              return Transform.translate(
                offset: offsetAnimation.value,
                child: Container(
                  width: animSize.value.width,
                  height: animSize.value.height,
                  child: child,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
