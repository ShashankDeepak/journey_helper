import 'dart:math';

import 'package:flutter/material.dart';
import 'package:journey_helper/cotroller/Controller.dart';
import 'package:journey_helper/service/google_maps_service.dart';
import 'package:journey_helper/views/home_page_nearby_locations.dart';
import 'package:journey_helper/views/service_places.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapsService service = GoogleMapsService();

  Future<void> getInitialData() async {
    Controller.locationModal = await service.getCurrentLocation();
  }

  late Future initData;

  @override
  void initState() {
    initData = getInitialData();
    super.initState();
  }

  var log = Logger();
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
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: h * 0.2,
                        width: w,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Controller.locationModal!.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                Controller.locationModal!.address,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Services",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ServicePlaces(
                                          place: "Tourist Spot",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/tourists.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text("Tourists")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ServicePlaces(
                                          place: "Bus stops",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/bus.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text("Bus Stop")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ServicePlaces(
                                          place: "Police",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/police.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text("Police")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ServicePlaces(
                                          place: "Hospitals",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/hospitals.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text("Hospital")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ServicePlaces(
                                          place: "Mechanic shop",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/mechanic.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text("Mechanic")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ServicePlaces(
                                          place: "Toll",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/toll.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text("Toll Stop")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ServicePlaces(
                                          place: "Resturants or Food shop",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/resturants.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text("Resturants")
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ServicePlaces(
                                          place:
                                              "Toilets or Washrooms or Restrooms",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/restrooms.png",
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text("Toilets")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Nearby Places",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Expanded(child: HomePageNearbyLocations())
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
