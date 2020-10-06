import 'package:flutter/material.dart';
import 'package:ext/ext.dart';

class Heading1 extends StatelessWidget {
  final String text;
  final TextStyle style;

  const Heading1(
    this.text, {
    Key key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headline1.merge(style),
    );
  }
}
