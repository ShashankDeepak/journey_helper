import 'package:flutter/material.dart';
import 'package:journey_helper/cotroller/Controller.dart';
import 'package:journey_helper/service/google_maps_service.dart';

class HomePageNearbyLocations extends StatefulWidget {
  const HomePageNearbyLocations({super.key});

  @override
  State<HomePageNearbyLocations> createState() =>
      _HomePageNearbyLocationsState();
}

class _HomePageNearbyLocationsState extends State<HomePageNearbyLocations> {
  GoogleMapsService service = GoogleMapsService();

  Future<void> getInitialData() async {
    if (Controller.nearByLocatations.isEmpty) {
      Controller.nearByLocatations = await service.getListOfNearByLocations();
    }
  }

  late Future initData;

  @override
  void initState() {
    initData = getInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<void>(
          future: initData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: Controller.nearByLocatations.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(Controller.nearByLocatations[index].name);
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
