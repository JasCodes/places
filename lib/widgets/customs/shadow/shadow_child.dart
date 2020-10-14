import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/widgets/customs/shadow/@shadow.dart';

class ShadowChild extends StatelessWidget {
  final ShadowController shadowController = Get.find();

  final ShadowBuilder builder;
  final ShadowRenderBuilder renderBuilder;
  final bool active;
  final int zIndex;

  ShadowChild({
    @required GlobalKey key,
    @required this.builder,
    @required this.renderBuilder,
    @required this.active,
    this.zIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _shadowChildren = shadowController.children;

    if (active) {
      _shadowChildren.add(
        ShadowModel(
          globalKey: key,
          builder: builder,
          renderBuilder: renderBuilder,
          zIndex: zIndex,
        ),
      );
      return IgnorePointer(
        ignoring: true,
        child: Opacity(
          opacity: 0,
          child: builder(context),
        ),
      );
    } else {
      _shadowChildren.removeWhere((child) => child.globalKey == key);
      return builder(context);
    }
  }
}
