// import 'package:apms_project/GlobalState/parking_controller.dart';
// import 'package:apms_project/Pages/Screens/Map/generate_map.dart';
// import 'package:apms_project/Utils/color_theme.dart';
// import 'package:apms_project/Utils/responsive_util.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:get/get.dart';
// import 'package:latlong2/latlong.dart';
//
// class MapPage extends StatefulWidget {
//   const MapPage({super.key});
//   @override
//   State<MapPage> createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late ParkingSpotController spotController = Get.put(ParkingSpotController());
//
//   // function to toggle card visibility in map
//   void _toggleContainer() {
//     setState(() {
//       if (spotController.showDetails) {
//         _animationController.forward();
//       } else {
//         spotController.toggleShowDetails(false);
//       }
//     });
//   }
//
//   // function to set selected spot details globally to generate ticket
//   void _markerController(String parkingName, String locationText) {
//     return setState(() {
//       spotController.toggleShowDetails(true);
//       _toggleContainer();
//       spotController.setParkingSpotDetails(parkingName, locationText);
//     });
//   }
//
//
//   // For animation
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 500),
//     );
//   }
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     // Locations
//     final List<Marker> customMarkers = [
//       createCustomMarker(LatLng(18.9894, 73.1175), "Panvel", "Royal Parking"),
//       createCustomMarker(LatLng(19.0166, 73.0966), "Kamothe", "3Net Parking"),
//       createCustomMarker(
//           LatLng(19.0473, 73.0699), "Kharghar", "Kharghar Parking Spot"),
//       createCustomMarker(LatLng(19.0188, 73.0388), "Belapur", "Ink Park")
//     ];
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Select Location"),
//       ),
//       body: Container(
//         width: ResponsiveUtils.screenWidth(context),
//         height: (ResponsiveUtils.screenHeight(context) -
//             kBottomNavigationBarHeight),
//         decoration: const BoxDecoration(color: Colors.white),
//         child: Stack(
//           alignment: AlignmentDirectional.center,
//           children: [
//             // Map
//             Positioned(
//               child: Container(
//                 // margin: const EdgeInsets.only(top: 12),
//                 clipBehavior: Clip.hardEdge,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(20),
//                     topLeft: Radius.circular(20),
//                   ),
//                 ),
//                 child: GenerateMap(customMarkers: customMarkers),
//               ),
//             ),
//
//             // Selected Location Indicator
//             spotController.showDetails
//                 ? Positioned(
//                     bottom: 10,
//                     child: SlideTransition(
//                       position: _buildAnimation().animate(
//                         CurvedAnimation(
//                           parent: _animationController,
//                           curve: Curves.easeInOut,
//                         ),
//                       ),
//                       child: Container(
//                           width: ResponsiveUtils.screenWidth(context) * 0.85,
//                           height: ResponsiveUtils.screenHeight(context) * 0.25,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(12),
//                             ),
//                           ),
//                           child: buildSelectedComponent(context)),
//                     ),
//                   )
//                 : const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Tween<Offset> _buildAnimation() {
//     return Tween<Offset>(
//       begin: const Offset(0, 2),
//       end: const Offset(0, 0),
//     );
//   }
//
//   // Create Bottom Component
//   Padding buildSelectedComponent(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Parking Spot",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 SizedBox(
//                   height: 40,
//                   width: 40,
//                   child: GestureDetector(
//                     onTap: () {
//                       spotController.toggleShowDetails(false);
//                       _animationController.reverse();
//                     },
//                     child: const Icon(
//                       Icons.cancel_rounded,
//                       size: 28,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Obx(() => Text("Name: ${spotController.parkingSpotName}")),
//           Obx(() => Text("Location: ${spotController.locationName}")),
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Center(
//               child: SizedBox(
//                 width: ResponsiveUtils.screenWidth(context) * 0.6,
//                 height: ResponsiveUtils.screenHeight(context) * 0.05,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _animationController.reverse();
//                     Navigator.pushNamed(context, "/booking");
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: ColorTheme.neogreenTheme,
//                       foregroundColor: ColorTheme.blackTheme),
//                   child: const Text(
//                     "Pick Spot",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   // Create Markers on Map
//   Marker createCustomMarker(
//       LatLng latLng, String locationText, String parkingName) {
//     return Marker(
//       width: ResponsiveUtils.screenWidth(context) * 0.2,
//       height: ResponsiveUtils.screenHeight(context) * 0.1,
//       point: latLng,
//       builder: (ctx) => GestureDetector(
//         onTap: () {
//           _markerController(parkingName, locationText);
//         },
//         child: Column(
//           children: [
//             Container(
//               height: ResponsiveUtils.screenHeight(context) * 0.06,
//               width: ResponsiveUtils.screenWidth(context) * 0.13,
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               child: Icon(
//                 Icons.local_parking,
//                 color: Colors.black,
//                 size: ResponsiveUtils.screenWidth(context) * 0.1,
//               ),
//             ),
//             Text(
//               locationText,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
