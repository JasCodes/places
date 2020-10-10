import 'package:flutter/material.dart';
import 'package:places/pages/travel_detail_page.dart';
import 'package:places/pages/travel_list_page.dart';
import 'package:places/routes/travel_list_route.dart';

Route Function(RouteSettings) onGenerateRoute = (settings) {
  switch (settings.name) {
    case TravelListPage.routeName:
      return TravelListPage.route;
    case TravelDetailPage.routeName:
      return TravelDetailPage.route;
    default:
      return travelListRoute;
  }
};
