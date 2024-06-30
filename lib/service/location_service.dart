import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  bool serviceEnabled = false;
  PermissionStatus locationPermissionState = PermissionStatus.denied;
  Future<LocationData?> getCurrentLocationData() async {
    if (locationPermissionState == PermissionStatus.denied) {
      await _getLocationPermission();
    }
    if (locationPermissionState == PermissionStatus.granted && serviceEnabled) {
      return location.getLocation();
    }
    return null;
  }

  Future<PermissionStatus> _getLocationPermission() async {
    if (locationPermissionState == PermissionStatus.denied) {
      locationPermissionState = await location.requestPermission();
    }
    if (serviceEnabled == false) {
      serviceEnabled = await location.requestService();
    }
    return locationPermissionState;
  }
}
