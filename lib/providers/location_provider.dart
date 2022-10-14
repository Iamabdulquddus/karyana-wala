import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier{

  late double latitude;
  late double longitude;
  bool permissionAllowed = false;

  Future<void> getCurrentPosition() async {
    permissionAllowed = true;
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    notifyListeners();
}

}