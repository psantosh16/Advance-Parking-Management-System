import 'package:get/get.dart';

class ParkingSpotController extends GetxController {
  var parkingSpotName = ''.obs;
  var locationName = ''.obs;

  void setParkingSpotDetails(String name, String location) {
    parkingSpotName.value = name;
    locationName.value = location;
  }

}
