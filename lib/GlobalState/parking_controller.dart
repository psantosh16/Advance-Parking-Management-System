import 'package:get/get.dart';

class ParkingSpotController extends GetxController {

  // Variables
  final _parkingSpotName = ''.obs;
  final _locationName = ''.obs;
  final _parkingImage = ''.obs;
  late final _slotSelected = 'B-4'.obs;
   late  bool _showDetails = false;

  // Getters
  get parkingSpotName => _parkingSpotName;
  get locationName => _locationName;
  get showDetails => _showDetails;
  get slotSelected => _slotSelected;
  get parkingImage => _parkingImage;


  // Methods
  void setParkingSpotDetails(String name, String location, String image) {
    _parkingSpotName.value = name;
    _locationName.value = location;
    _parkingImage.value = image;
  }

  void toggleShowDetails(bool value) {
    _showDetails = value;
    if (_showDetails == false) {
      setParkingSpotDetails("", "","");
    }
    // update();
  }

  void setSlot(String slotSelected){
    _slotSelected.value = slotSelected;
  }
}
