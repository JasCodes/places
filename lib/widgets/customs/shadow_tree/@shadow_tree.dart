import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef Widget ShadowBuilder(BuildContext context);
typedef Widget ShadowRenderBuilder(
  BuildContext context,
  BuildContext shadowContext,
  Widget child,
);

// class ShadowObject {
//   ShadowObject(this.builder, this.shadowContext);
//   final ShadowBuilder builder;
//   final BuildContext shadowContext;
// }

class ShadowController extends GetxController {
  final targetBuilders = Map<GlobalKey, ShadowBuilder>().obs;
  final targetRenderBuilders = Map<GlobalKey, ShadowRenderBuilder>().obs;
  final frontBuilders = Map<GlobalKey, ShadowBuilder>().obs;
}

class ShadowTree extends StatelessWidget {
  final shadowController = Get.put(ShadowController());

  final Widget child;
  ShadowTree({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print('built shadow tree');
      final List<Widget> _stackList = [child];
      shadowController.targetBuilders.forEach((key, builder) {
        final r = shadowController.targetRenderBuilders[key](
          context,
          key.currentContext,
          builder(context),
        );
        _stackList.add(r);
      });

      return Stack(
        // fit: StackFit.expand,
        children: _stackList,
      );
    });
  }
}

// final RenderBox box = s.shadowContext.findRenderObject();
// final a = box.localToGlobal(Offset.zero);
// print(a);
// _stackList.add(
//   Positioned(
//     left: a.dx,
//     top: a.dy,
//     child: Container(
//       constraints: box.constraints,
//       child: s.builder(s.shadowContext),
//     ),
//   ),
// );
