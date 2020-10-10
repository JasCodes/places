import 'package:flutter/material.dart';
import 'package:places/gen/assets.gen.dart';

class Profile extends StatelessWidget {
  final double width;
  final double height;
  const Profile({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Assets.images.profile.image(fit: BoxFit.cover),
      // child: Image.asset(Assets.images.profile.path),
      width: width,
      height: height,
    );
  }
}
