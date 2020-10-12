import 'package:get/state_manager.dart';
import 'package:places/gen/assets.gen.dart';
import 'package:places/models/places_model.dart';

class PlacesController extends GetxController {
  final places = RxList<PlacesModel>();
  PlacesController() {
    places.add(
      PlacesModel(
        cardTitle: "AMRITSAR",
        cardSubtitle: "North India",
        descHeader: "THE GOLDEN\nTEMPLE/PUNJAB",
        descTitle: "Overview",
        descText: "XXX",
        images: [Assets.images.amritsar],
      ),
    );
    places.add(
      PlacesModel(
        cardTitle: "AMRITSAR",
        cardSubtitle: "North India",
        descHeader: "THE GOLDEN\nTEMPLE/PUNJAB",
        descTitle: "Overview",
        descText: "XXX",
        images: [Assets.images.mallorca],
      ),
    );
    places.add(
      PlacesModel(
        cardTitle: "AMRITSAR",
        cardSubtitle: "North India",
        descHeader: "THE GOLDEN\nTEMPLE/PUNJAB",
        descTitle: "Overview",
        descText: "XXX",
        images: [Assets.images.sweden],
      ),
    );
    places.add(
      PlacesModel(
        cardTitle: "AMRITSAR",
        cardSubtitle: "North India",
        descHeader: "THE GOLDEN\nTEMPLE/PUNJAB",
        descTitle: "Overview",
        descText: "XXX",
        images: [Assets.images.cameron],
      ),
    );
    places.add(
      PlacesModel(
        cardTitle: "AMRITSAR",
        cardSubtitle: "North India",
        descHeader: "THE GOLDEN\nTEMPLE/PUNJAB",
        descTitle: "Overview",
        descText: "XXX",
        images: [Assets.images.iceland],
      ),
    );
  }
}
