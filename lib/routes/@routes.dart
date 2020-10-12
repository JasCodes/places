import 'package:flutter/material.dart';
import 'package:places/pages/detail_page.dart';
import 'package:places/pages/list_page.dart';

Route Function(RouteSettings) onGenerateRoute = (settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case ListPage.routeName:
      return ListPage.route();
    case DetailPage.routeName:
      return DetailPage.route(args: args);
    default:
      return ListPage.route();
  }
};
