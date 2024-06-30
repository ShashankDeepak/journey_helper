import 'package:flutter/material.dart';
import 'package:journey_helper/modal/location_modal.dart';
import 'package:journey_helper/service/google_maps_service.dart';
import 'package:journey_helper/views/home_page_nearby_locations.dart';

class ServicePlaces extends StatefulWidget {
  final String place;
  const ServicePlaces({super.key, required this.place});

  @override
  State<ServicePlaces> createState() => _ServicePlacesState();
}

class _ServicePlacesState extends State<ServicePlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.place),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: HomePageNearbyLocations(
            place: widget.place,
          ),
        ));
  }
}
