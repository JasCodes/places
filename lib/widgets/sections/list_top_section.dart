import 'package:flutter/material.dart';
import 'package:ext/ext.dart';

class ListTopSection extends StatelessWidget {
  const ListTopSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 40,
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.menu),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    width: 45,
                    height: 45,
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            Container(
              // color: Colors.green,
              // height: 80,
              child: Text(
                "Discover the\nworld in you!",
                style: context.textTheme.headline4,
              ),
            ),
            SizedBox(height: 50),
            Container(color: Colors.green, height: 70),
          ],
        ),
      ),
    );
  }
}
