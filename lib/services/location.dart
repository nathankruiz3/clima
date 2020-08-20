import 'package:geolocator/geolocator.dart';

class Location {
  double myLat, myLong;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      myLat = position.latitude;
      myLong = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
