class LocationModal {
  String placeId = "";
  String name = "";
  String address = "";
  int rating = 0;
  bool openNow = false;
  String mapUrl = "";

  void setFromMap({required dynamic map, String? name}) {
    placeId = map["place_id"];
    this.name = name ?? map["formatted_address"];
    rating = map["user_ratings_total"];
    openNow = map["opening_hours"]["open_now"];
    mapUrl = map["url"];
    address = map["formatted_address"];
  }

  bool isEmpty() {
    return placeId.isEmpty;
  }

  bool isNotEmpty() {
    return !isEmpty();
  }
}
