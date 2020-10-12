import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef Widget ShadowBuilder(BuildContext context);

class ShadowObject {
  ShadowObject(this.builder, this.shadowContext);
  final ShadowBuilder builder;
  final BuildContext shadowContext;
}

class ShadowController extends GetxController {
  final targetBuilders = RxList<ShadowObject>();
  final frontBuilders = RxList<ShadowObject>();
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
      final List<Widget> _stackList = [child];

      shadowController.targetBuilders.forEach((s) {
        final RenderBox box = s.shadowContext.findRenderObject();
        final a = box.localToGlobal(Offset.zero);
        // print(a.dx);
        _stackList.add(
          Positioned(
            left: a.dx,
            top: a.dy,
            child: Container(
              constraints: box.constraints,
              child: s.builder(s.shadowContext),
            ),
          ),
        );
      });
      return Stack(
        // fit: StackFit.expand,
        children: _stackList,
      );
    });
  }
}
