import 'package:flutter/material.dart';
import 'package:places/widgets/layouts/list/app_bar_x/menu.dart';
import 'package:places/widgets/layouts/list/app_bar_x/profile.dart';

class AppBarX extends StatelessWidget {
  const AppBarX({Key key}) : super(key: key);

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
