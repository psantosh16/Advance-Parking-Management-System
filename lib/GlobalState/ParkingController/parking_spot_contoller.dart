import 'package:flutter/foundation.dart';
import '../Models/parking_model.dart';

class ParkingSpotProvider extends ChangeNotifier {
  late ParkingSpot _selectedParkingSpot;
  bool _showDetails = false;

  ParkingSpot get selectedParkingSpot => _selectedParkingSpot;
  bool get showDetails => _showDetails;

  void setParkingSpotDetails(ParkingSpot parkingSpot) {
    _selectedParkingSpot = parkingSpot;
    _showDetails = true;
    notifyListeners();
  }

  void toggleShowDetails(bool value) {
    _showDetails = value;
    if (!_showDetails) {
      _selectedParkingSpot = '' as ParkingSpot;
    }
    notifyListeners();
  }
}
