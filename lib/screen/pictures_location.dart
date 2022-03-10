// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// // ignore: must_be_immutable
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key, required this.latitude, required this.longitude})
//       : super(key: key);

//   static double latitude;
//   static double longitude;

//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   static final Marker _kGooglePlexMarker = Marker(
//       infoWindow: const InfoWindow(title: 'Location Photo'),
//       icon: BitmapDescriptor.defaultMarker,
//       position: LatLng(
//           MapScreen.latitude, MapScreen.longitude));

//   @override
//   void initState() {
//     MapScreen.latitude = latitude;
//     MapScreen.longitude = longitude;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         markers: {_kGooglePlexMarker},
//         initialCameraPosition: CameraPosition(
//           target: LatLng(MapScreen.latitude,
//               MapScreen.longitude),
//           zoom: 11.5,
//         ),
//       ),
//     );
//   }
// }
