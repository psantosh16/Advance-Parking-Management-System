import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class GenerateMap extends StatelessWidget {
  const GenerateMap({
    super.key,
    required this.customMarkers,
  });

  final List<Marker> customMarkers;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: _buildMapOptions(),
      children: [
        _buildTileLayer(),
        buildMarkerClusterLayerWidget(),
      ],
    );
  }

  TileLayer _buildTileLayer() {
    return TileLayer(
        urlTemplate:
        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
        subdomains: const ['a', 'b', 'c'],
      );
  }

  MarkerClusterLayerWidget buildMarkerClusterLayerWidget() {
    return MarkerClusterLayerWidget(
        options: buildMarkerClusterLayerOptions(),
      );
  }

  MarkerClusterLayerOptions buildMarkerClusterLayerOptions() {
    return MarkerClusterLayerOptions(
          maxClusterRadius: 45,
          size: const Size(40, 40),
          anchor: AnchorPos.align(AnchorAlign.center),
          fitBoundsOptions: const FitBoundsOptions(
            padding: EdgeInsets.all(50),
            maxZoom: 30,
          ),
          markers: customMarkers,
          builder: (context, customMarkers) {
            return const SizedBox() ;
          });
  }

  MapOptions _buildMapOptions() {
    return MapOptions(
      keepAlive: true,
      center: LatLng(19.029267, 73.062162),
      zoom: 12.0,
      minZoom: 10.0,
      maxZoom: 18.0,
    );
  }
}
