import 'package:flutter/material.dart';
import 'package:places/widgets/components/menu.dart';
import 'package:places/widgets/components/profile.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Menu(
          width: 18,
          height: 16,
        ),
        Profile(
          width: 40,
          height: 40,
        )
      ],
    );
  }
}
