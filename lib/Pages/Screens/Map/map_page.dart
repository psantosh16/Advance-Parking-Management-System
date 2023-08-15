import 'package:apms_project/Utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart'; // For LatLng class

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Marker createCustomMarker(LatLng latLng, String markerText) {
    return Marker(
      width: 40.0,
      height: 40.0,
      point: latLng,
      builder: (ctx) =>  Icon(
        Icons.local_parking,
        color: Colors.black,
        size: ResponsiveUtils.screenWidth(context) * 0.13,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Locations
    List<Marker> customMarkers = [
      createCustomMarker(LatLng(18.9894, 73.1175), "Marker 1"),
      createCustomMarker(LatLng(19.0166, 73.0966), "Marker 2"),
      createCustomMarker(LatLng(19.0473, 73.0699), "Marker 3"),
      createCustomMarker(LatLng(19.0188, 73.0388), "Marker 4")
      // Add more markers as needed
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          padding:
              EdgeInsets.only(top: ResponsiveUtils.screenWidth(context) * 0.12),
          width: ResponsiveUtils.screenWidth(context),
          height: (ResponsiveUtils.screenHeight(context) -
              kBottomNavigationBarHeight),
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                       topRight: Radius.circular(20),topLeft: Radius.circular(20),
                    ),
                  ),
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(19.029267, 73.062162),
                      zoom: 12.0,
                      minZoom: 10.0,
                      maxZoom: 18.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      MarkerClusterLayerWidget(
                        options: MarkerClusterLayerOptions(
                            maxClusterRadius: 45,
                            size: const Size(40, 40),
                            anchor: AnchorPos.align(AnchorAlign.center),
                            fitBoundsOptions: const FitBoundsOptions(
                              padding: EdgeInsets.all(50),
                              maxZoom: 30,
                            ),
                            markers: customMarkers,
                            builder: (context, customMarkers) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue),
                                child: Center(
                                  child: Text(
                                    customMarkers.length.toString(),
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
