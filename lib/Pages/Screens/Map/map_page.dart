import 'package:apms_project/GlobalState/parking_controller.dart';
import 'package:apms_project/Pages/Screens/Map/generate_map.dart';
import 'package:apms_project/Utils/color_theme.dart';
import 'package:apms_project/Utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart'; // For LatLng class

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Local State
  bool _showDetails = false;

  // Global State
  late ParkingSpotController spotController = Get.put(ParkingSpotController());

  // Create Markers on Map
  Marker createCustomMarker(
      LatLng latLng, String locationText, String parkingName) {
    return Marker(
      width: ResponsiveUtils.screenWidth(context) * 0.2,
      height: ResponsiveUtils.screenHeight(context) * 0.1,
      point: latLng,
      builder: (ctx) => GestureDetector(
        onTap: () {
          setState(() {
            spotController.setParkingSpotDetails(parkingName, locationText);
            _showDetails = true;
          });
        },
        child: Column(
          children: [
            Icon(
              Icons.local_parking,
              color: Colors.red[800],
              size: ResponsiveUtils.screenWidth(context) * 0.13,
            ),
            Text(
              locationText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // Locations
    List<Marker> customMarkers = [
      createCustomMarker(LatLng(18.9894, 73.1175), "Panvel", "Royal Parking"),
      createCustomMarker(LatLng(19.0166, 73.0966), "Kamothe", "3Net Parking"),
      createCustomMarker(
          LatLng(19.0473, 73.0699), "Kharghar", "Kharghar Parking Spot"),
      createCustomMarker(LatLng(19.0188, 73.0388), "Belapur", "Ink Park")
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Select Location"),
      ),
      body: Container(
        width: ResponsiveUtils.screenWidth(context),
        height: (ResponsiveUtils.screenHeight(context) -
            kBottomNavigationBarHeight),
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // Map
            Positioned(
              child: Container(
                // margin: const EdgeInsets.only(top: 12),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: GenerateMap(customMarkers: customMarkers),
              ),
            ),

            // Selected Location Indicator
            Positioned(
              bottom: 10,
              child: Container(
                width: ResponsiveUtils.screenWidth(context) * 0.85,
                height: ResponsiveUtils.screenHeight(context) * 0.25,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: _showDetails
                    ? buildSelectedComponent(context)
                    : const Center(
                        child: Text(
                          "Please select location",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildSelectedComponent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Parking Spot",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: ColorTheme.neogreenTheme,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Icon(Icons.car_rental),
                )
              ],
            ),
          ),
          Obx(() =>
              Text("Name: ${spotController.parkingSpotName.toUpperCase()}")),
          Obx(() =>
              Text("Location: ${spotController.locationName.toUpperCase()}")),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: SizedBox(
                width: ResponsiveUtils.screenWidth(context) * 0.6,
                height: ResponsiveUtils.screenHeight(context) * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/booking");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorTheme.neogreenTheme,
                      foregroundColor: ColorTheme.blackTheme),
                  child: const Text(
                    "Book Spot",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
