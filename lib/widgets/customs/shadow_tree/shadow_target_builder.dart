import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/widgets/customs/shadow_tree/@shadow_tree.dart';

class ShadowTargetBuilder extends StatelessWidget {
  final ShadowController shadowController = Get.find();
  final ShadowBuilder builder;
  final bool active;
  final isFront;

  ShadowTargetBuilder({
    Key key,
    @required this.builder,
    @required this.active,
    this.isFront = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _list = isFront
        ? shadowController.frontBuilders
        : shadowController.targetBuilders;
    if (active) {
      _list.add(ShadowObject(builder, context));
      return IgnorePointer(
        ignoring: true,
        child: Opacity(
          opacity: 0,
          child: builder(context),
        ),
      );
    } else {
      _list.remove(builder);
      return builder(context);
    }
  }
}
