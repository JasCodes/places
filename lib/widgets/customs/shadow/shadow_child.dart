import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:places/widgets/customs/shadow/@shadow.dart';

class ShadowChild extends StatefulWidget {
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
  _ShadowChildState createState() => _ShadowChildState();
}

class _ShadowChildState extends State<ShadowChild> {
  final ShadowController shadowController = Get.find();

  @override
  void dispose() {
    shadowController.children
        .removeWhere((child) => child.globalKey == widget.key);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _shadowChildren = shadowController.children;

    if (widget.active) {
      _shadowChildren.add(
        ShadowModel(
          globalKey: widget.key,
          builder: widget.builder,
          renderBuilder: widget.renderBuilder,
          zIndex: widget.zIndex,
        ),
      );

      return IgnorePointer(
        ignoring: true,
        child: Opacity(
          opacity: 0,
          child: widget.builder(context),
        ),
      );
    } else {
      _shadowChildren.removeWhere((child) => child.globalKey == widget.key);
      return widget.builder(context);
    }
  }
}
