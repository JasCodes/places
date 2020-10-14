import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:places/routes/list_route.dart';

Widget cardListDetailTransitionBuilder(
  BuildContext context,
  BuildContext shadowContext,
  Widget child,
) {
  final ListRouteProps props = Get.find();
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
}
