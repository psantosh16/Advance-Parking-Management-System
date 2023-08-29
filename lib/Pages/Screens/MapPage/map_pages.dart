import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../GlobalState/parking_controller.dart';
import '../../../Utils/color_theme.dart';
import '../../../Utils/responsive_util.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>  with SingleTickerProviderStateMixin{
  List<Marker> markers = [];
  late AnimationController _animationController;
  late ParkingSpotController spotController = Get.put(ParkingSpotController());

  // function to toggle card visibility in map
  void _toggleContainer() {
    setState(() {
      if (spotController.showDetails) {
        _animationController.forward();
      } else {
        spotController.toggleShowDetails(false);
      }
    });
  }

  // function to set selected spot details globally to generate ticket
  void _markerController(String parkingName, String locationText) {
    return setState(() {
      spotController.toggleShowDetails(true);
      _toggleContainer();
      spotController.setParkingSpotDetails(parkingName, locationText);
    });
  }

  Future<void> fetchMarkers() async {
    final response =
        await http.get(Uri.parse("http://localhost:1437/api/places"));
    if (response.statusCode == 200) {
      final List<dynamic> markerData = json.decode(response.body);
      setState(() {
        markers = markerData.map<Marker>((data) {
          return Marker(
            width: ResponsiveUtils.screenWidth(context) * 0.2,
            height: ResponsiveUtils.screenHeight(context) * 0.1,
            point: LatLng(data['lat'], data['lon']),
            builder: (context) => GestureDetector(
              onTap: () {
                _markerController(data['name'], data['address']);
              },
              child: Column(
                children: [
                  Container(
                    height: ResponsiveUtils.screenHeight(context) * 0.06,
                    width: ResponsiveUtils.screenWidth(context) * 0.13,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(
                      Icons.local_parking,
                      color: Colors.black,
                      size: ResponsiveUtils.screenWidth(context) * 0.1,
                    ),
                  ),
                  Text(
                    data['address'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }).toList();
      });
    } else {
      throw Exception('Failed to fetch markers');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMarkers();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  Tween<Offset> _buildAnimation() {
    return Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0.1, 0),
    );
  }

  Padding buildSelectedComponent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Parking Spot",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: GestureDetector(
                  onTap: () {
                    _animationController.reverse();
                    spotController.toggleShowDetails(false);
                  },
                  child: const Icon(
                    Icons.cancel_rounded,
                    size: 28,
                  ),
                ),
              )
            ],
          ),
          Obx(() => Text("Name: ${spotController.parkingSpotName}")),
          Obx(() => Text("Location: ${spotController.locationName}")),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: SizedBox(
                width: ResponsiveUtils.screenWidth(context) * 0.6,
                height: ResponsiveUtils.screenHeight(context) * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    _animationController.reverse();
                    Navigator.pushNamed(context, "/booking");
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorTheme.neogreenTheme,
                      foregroundColor: ColorTheme.blackTheme),
                  child: const Text(
                    "Pick Spot",
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
      ),
      body: SizedBox(
        width: ResponsiveUtils.screenWidth(context),
        height: (ResponsiveUtils.screenHeight(context) -
            kBottomNavigationBarHeight),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(18.9951, 73.0763),
                    zoom: 12,
                  ),
                  nonRotatedChildren: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerClusterLayerWidget(
                      options: MarkerClusterLayerOptions(
                        maxClusterRadius: 40,
                        size: const Size(40, 40),
                        anchor: AnchorPos.align(AnchorAlign.center),
                        fitBoundsOptions: const FitBoundsOptions(
                          padding: EdgeInsets.all(50),
                          maxZoom: 15,
                        ),
                        markers: markers,
                        builder: (context, markers) {
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            spotController.showDetails
                ? Positioned(
              bottom: 20,
              child: SlideTransition(
                position: _buildAnimation().animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: Container(
                    width: ResponsiveUtils.screenWidth(context) * 0.85,
                    height: ResponsiveUtils.screenHeight(context) * 0.25,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: buildSelectedComponent(context)),
              ),
            )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
