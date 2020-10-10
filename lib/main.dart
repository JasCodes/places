import 'package:flutter/material.dart';
import 'package:places/routes/routes.dart';

void main() {
  runApp(App());
}

class BounceScrollBehavior extends ScrollBehavior {
  @override
  getScrollPhysics(_) => const BouncingScrollPhysics();
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Places',
      builder: (context, child) {
        return ScrollConfiguration(
          child: child,
          behavior: MyBehavior(),
        );
      },
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: TravelList(),
      // home: PageA(),
    );
  }
}
