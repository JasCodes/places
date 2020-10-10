import 'package:flutter/material.dart';
import 'package:places/routes/detail_route.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = '/detail';
  static final route = detailRoute;

  const DetailPage({Key key}) : super(key: key);

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
