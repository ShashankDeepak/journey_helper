import 'package:flutter/material.dart';
import 'package:journey_helper/cotroller/Controller.dart';
import 'package:journey_helper/modal/location_modal.dart';
import 'package:journey_helper/service/google_maps_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageNearbyLocations extends StatefulWidget {
  final String place;
  const HomePageNearbyLocations({super.key, this.place = ""});

  @override
  State<HomePageNearbyLocations> createState() =>
      _HomePageNearbyLocationsState();
}

class _HomePageNearbyLocationsState extends State<HomePageNearbyLocations> {
  GoogleMapsService service = GoogleMapsService();
  late List<LocationModal> list;
  Future<void> getInitialData() async {
    if (widget.place.isNotEmpty) {
      list = await service.getListOfNearByLocationsByKeyword(widget.place);
    } else if (Controller.nearByLocatations.isEmpty) {
      Controller.nearByLocatations = await service.getListOfNearByLocations();
      list = Controller.nearByLocatations;
    }
  }

  late Future initData;

  @override
  void initState() {
    initData = getInitialData();
    super.initState();
  }

  MaterialColor getColorFromRating(double rating) {
    if (rating > 0 && rating < 2) return Colors.red;
    if (rating > 0 && rating < 3.5) {
      return Colors.amber;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<void>(
          future: initData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  LocationModal modal = list[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        launchUrl(Uri.parse(modal.mapUrl));
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: Text(
                            modal.rating != 0 ? modal.rating.toString() : "",
                            style: TextStyle(
                              color: getColorFromRating(modal.rating),
                              fontSize: 16,
                            ),
                          ),
                          title: Text(
                            modal.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: w * 0.6, child: Text(modal.address)),
                              // Text(modal.rating.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
