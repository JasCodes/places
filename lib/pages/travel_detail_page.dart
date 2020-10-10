import 'package:flutter/material.dart';
import 'package:places/routes/travel_detail_route.dart';

class TravelDetailPage extends StatelessWidget {
  static const String routeName = '/detail';
  static final route = travelDetailRoute;

  const TravelDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelDetailPage'),
      ),
      body: Center(
        child: Text('TravelDetailPage'),
      ),
    );
  }
}
