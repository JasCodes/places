import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/widgets/customs/shadow_tree/@shadow_tree.dart';

class ShadowTargetBuilder extends StatelessWidget {
  final ShadowController shadowController = Get.find();

  final ShadowBuilder builder;
  final ShadowRenderBuilder renderBuilder;
  final bool active;
  final isFront;

  ShadowTargetBuilder({
    @required GlobalKey key,
    @required this.builder,
    @required this.renderBuilder,
    @required this.active,
    this.isFront = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _builder = isFront
        ? shadowController.frontBuilders
        : shadowController.targetBuilders;

    final _renderBuilder = shadowController.targetRenderBuilders;

    // final _build = Container(key: ,) builder(context);
    if (active) {
      _builder.add(key, builder);
      _renderBuilder.add(key, renderBuilder);
      return IgnorePointer(
        ignoring: true,
        child: Opacity(
          opacity: 0,
          child: builder(context),
        ),
      );
    } else {
      if (_builder.containsKey(key)) _builder.remove(key);
      if (_renderBuilder.containsKey(key)) _renderBuilder.remove(key);
      return builder(context);
    }
  }
}
