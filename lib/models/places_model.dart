import 'package:flutter/foundation.dart';
import 'package:places/gen/assets.gen.dart';

class PlacesModel {
  final String cardTitle;
  final String cardSubtitle;
  final String descHeader;
  final String descTitle;
  final String descText;
  final List<AssetGenImage> images;

  PlacesModel({
    @required this.cardTitle,
    @required this.cardSubtitle,
    @required this.descHeader,
    @required this.descTitle,
    @required this.descText,
    @required this.images,
  });
}
