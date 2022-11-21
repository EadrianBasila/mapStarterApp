import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String apiKey = "IFtSE2MH4pH9NWEVuAYOADCyGo9FNSOC";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Map'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Flexible(
                  child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(51.5, -0.09),
                        zoom: 13.0,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://api.tomtom.com/map/1/tile/basic/main/"
                              "{z}/{x}/{y}.png?key={apiKey}",
                          additionalOptions: {"apiKey": apiKey},
                        ),
                        MarkerLayer(markers: [
                          Marker(
                              point: LatLng(51.5, -0.09),
                              builder: (context) => Icon(Icons.location_on,
                                  color: Colors.red, size: 40.0))
                        ])
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}

// FlutterMap(
//         options: MapOptions(
//           center: LatLng(51.5, -0.09),
//           zoom: 13.0,
//         ),
//         layers: [
//           TileLayerOptions(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c']
//           ),
//           MarkerLayerOptions(
//             markers: [
//               Marker(
//                 width: 80.0,
//                 height: 80.0,
//                 point: LatLng(51.5, -0.09),
//                 builder: (ctx) =>
//                 Container(
//                   child: FlutterLogo(),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),