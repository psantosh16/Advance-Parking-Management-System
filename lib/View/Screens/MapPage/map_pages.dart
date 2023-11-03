import 'dart:async';
import 'dart:convert';
import 'package:apms_project/Controller/Models/parking_model.dart';
import 'package:apms_project/Controller/ParkingController/parking_spot_controller.dart';
import 'package:apms_project/View/auth/showmessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../../../Utils/color_theme.dart';
import '../../../Utils/responsive_util.dart';
import 'package:http/http.dart' as http;

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>
    with SingleTickerProviderStateMixin {
  List<Marker> markers = [];
  List<Marker> waitForMarker = [
    Marker(
      width: 100,
      height: 100,
      point: LatLng(18.9951, 73.0763),
      builder: (context) => const Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 12,
          ),
          Text(
            "Wait",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    ),
  ];
  bool isLoading = true;

  final GlobalKey<ScaffoldState> _mapScaffoldKey = GlobalKey<ScaffoldState>();
  final MapController _mapController = MapController();
  final LatLng _initialLocation = LatLng(18.9951, 73.0763);

  Future<void> _refreshMap() async {
    try {
      await Future.delayed(const Duration(seconds: 2)).then((v) {
        LatLng newLocation = _initialLocation;
        _mapController.move(newLocation, 11.0);
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      showmessage(context, "Error Something went wrong!");
    }
  }

  MapOptions mapOptions = MapOptions(
    center: LatLng(18.9951, 73.0763),
    zoom: 11,
    maxZoom: 14,
    minZoom: 11,
    rotation: 0,
    interactiveFlags: InteractiveFlag.pinchZoom |
        InteractiveFlag.drag |
        InteractiveFlag.doubleTapZoom |
        InteractiveFlag.rotate,
    keepAlive: true,
  );

  // function to toggle card visibility in map
  void _toggleContainer() {
    final parkingController =
        Provider.of<ParkingSpotProvider>(context, listen: false);

    if (parkingController.showDetails) {
      buildSelectedComponent(context);
    } else {
      parkingController.toggleShowDetails(false);
    }
  }

  // function to set selected spot details globally to generate ticket
  void _dataSetter(String parkingName, String locationText, String image) {
    final parkingController =
        Provider.of<ParkingSpotProvider>(context, listen: false);
    parkingController.toggleShowDetails(true);
    _toggleContainer();
    parkingController
        .setParkingSpotDetails(ParkingSpot(parkingName, locationText, image));
  }

  // Fetching locations to be shown on map
  Future<void> fetchMarkers() async {
    try {
      final response = await http
          .get(Uri.parse("https://apms-backend.vercel.app/api/places"));

      if (response.statusCode == 200) {
        final List<dynamic> markerData = json.decode(response.body);
        markers = markerData.map<Marker>((data) {
          return Marker(
            width: ResponsiveUtils.screenWidth(context) * 0.2,
            height: ResponsiveUtils.screenHeight(context) * 0.1,
            point: LatLng(data['lat'], data['lon']),
            builder: (context) => GestureDetector(
              onTap: () {
                _dataSetter(data['name'], data['address'], data['image']);
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
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
        }).toList();

        isLoading = false;
        setState(() {});
      } else {
        throw Exception('Failed to fetch markers');
      }
    } catch (e) {
      isLoading = true;
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (isLoading) {
        fetchMarkers();
      } else {
        timer.cancel();
      }
    });
  }

  // Dialog (Card on map ) Builder function
  void buildSelectedComponent(BuildContext context) {
    final parkingController =
        Provider.of<ParkingSpotProvider>(context, listen: false);
    showModalBottomSheet(
        constraints: BoxConstraints(
          maxHeight: ResponsiveUtils.screenHeight(context) * 0.81,
          maxWidth: ResponsiveUtils.screenWidth(context),
          minHeight: ResponsiveUtils.screenWidth(context),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        isDismissible: true,
        context: context,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Close Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selected Parking Spot",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                ResponsiveUtils.textScaleFactor(context) * 20),
                      ),
                      InkWell(
                          onTap: () {
                            parkingController.toggleShowDetails(false);
                            Navigator.pop(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                              ))),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Details
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  fit: BoxFit.cover,
                                  // spotController.parkingImage.toString(),
                                  parkingController.selectedParkingSpot.image,
                                  width: ResponsiveUtils.screenWidth(context),
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            // Parking Name
                            Text(
                              // spotController.parkingSpotName.toString(),
                              parkingController.selectedParkingSpot.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              // "${spotController.locationName.toString()},IN",
                              "${parkingController.selectedParkingSpot.location},IN",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: ColorTheme.grayTheme),
                            ),
                            const Divider(
                              height: 40,
                              thickness: 1.2,
                            ),
                            Text(
                              "One of the best parking spot available in Navi Mumbai Region, ${parkingController.selectedParkingSpot.location} , called ${parkingController.selectedParkingSpot.location}.Featuring whooping 1000 parking spots.",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                      // Booking Button
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(ResponsiveUtils.screenWidth(context), 20),
                            backgroundColor: ColorTheme.neogreenTheme,
                            foregroundColor: ColorTheme.blackTheme),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/booking');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "PICK SPOT",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.whiteTheme,
        foregroundColor: ColorTheme.blackTheme,
        onPressed: () {
          _refreshMap();
        },
        child: const Icon(Icons.refresh),
      ),
      key: _mapScaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
      ),
      body: FutureBuilder(
        future: fetchMarkers(),
        builder: (context, snapshot) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              width: ResponsiveUtils.screenWidth(context),
              height: (ResponsiveUtils.screenHeight(context) -
                  kBottomNavigationBarHeight),
              child: Stack(
                children: [
                  FlutterMap(
                    options: mapOptions,
                    mapController: _mapController,
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      if (!isLoading)
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
                  if (isLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
