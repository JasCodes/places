import 'package:flutter/material.dart';
import 'package:places/gen/assets.gen.dart';

class PlaceImageData {
  static Image toImage(AssetGenImage agi) {
    return agi.image(fit: BoxFit.cover);
  }

  static List<Image> list() {
    return [
      toImage(Assets.images.amritsar),
      toImage(Assets.images.mallorca),
      toImage(Assets.images.sweden),
      toImage(Assets.images.cameron),
      toImage(Assets.images.iceland),
    ];
  }
}
