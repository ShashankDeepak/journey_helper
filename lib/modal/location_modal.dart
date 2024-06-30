import 'dart:ffi';

import 'package:logger/logger.dart';

class LocationModal {
  String placeId = "";
  String name = "";
  String address = "";
  double rating = 0;
  bool openNow = false;
  String mapUrl = "";

  var log = Logger();

  void setFromMap({required dynamic map, String? name}) {
    log.d(map["place_id"]);
    placeId = map["place_id"];
    log.d(name ?? map["formatted_address"]);
    this.name = name ?? map["formatted_address"];
    log.d(map["rating"] ?? 0);
    rating = map["rating"] != null ? map["rating"].toDouble() : 0.0;
    log.d(map["opening_hours"] != null
        ? map["opening_hours"]["open_now"]
        : false);
    openNow =
        map["opening_hours"] != null ? map["opening_hours"]["open_now"] : false;
    log.d(map["url"]);
    mapUrl = map["url"];
    log.d(map["formatted_address"]);
    address = map["formatted_address"];
  }

  bool isEmpty() {
    return placeId.isEmpty;
  }

  bool isNotEmpty() {
    return !isEmpty();
  }
}
