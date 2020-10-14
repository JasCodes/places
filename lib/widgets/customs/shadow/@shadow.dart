import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef Widget ShadowBuilder(BuildContext context);
typedef Widget ShadowRenderBuilder(
  BuildContext context,
  BuildContext shadowChildContext,
  Widget child,
);

class ShadowModel {
  ShadowModel({
    @required this.globalKey,
    @required this.zIndex,
    @required this.builder,
    @required this.renderBuilder,
  });
  final GlobalKey globalKey;
  final int zIndex;
  final ShadowBuilder builder;
  final ShadowRenderBuilder renderBuilder;
}

class ShadowController extends GetxController {
  final children = RxList<ShadowModel>();
}

class Shadow extends StatelessWidget {
  final shadowController = Get.put(ShadowController());

  final Widget child;
  Shadow({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print('rebuilt shadow tree:${shadowController.children.length}');
      final _stackList = [child];
      // final _children = shadowController.children.value;
      // _children.sort((a, b) => a.zIndex - b.zIndex);
      ;
      shadowController.children.forEach((child) {
        final renderBuild = child.renderBuilder(
          context,
          child.globalKey.currentContext,
          child.builder(context),
        );
        _stackList.add(renderBuild);
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
