import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final String initialAddress;
  

  MapScreen({required this.initialAddress});

  @override
  _MapScreenState createState() => _MapScreenState();
  
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late String searchAddress;
  
  

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    searchAddress = widget.initialAddress;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: Column(
        children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Address...',
                suffixIcon: IconButton(
                  onPressed: () {
                    searchAndMarkOnMap();
                  },
                  icon: Icon(Icons.search),
                ),
              ),
              onChanged: (value) {
                searchAddress = value;
              },
            ),
          ),
          SizedBox(height: 750,
          
            child: GoogleMap(
              initialCameraPosition:const CameraPosition(
                target: LatLng(41.015137, 28.979530),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: markers,
            ),
          ),
          
        ],
      ),
    );
  }

  Future<void> searchAndMarkOnMap() async {
    if (searchAddress.isEmpty) {
      return;
    }

    final query = searchAddress;
    final List<Location> locations =
        await locationFromAddress(query);

    if (locations.isEmpty) {
      return;
    }

    final location = locations.first;
    final latLng = LatLng(location.latitude, location.longitude);

    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId('marker_id'),
          position: latLng,
        ),
      );
    });

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 15,
        ),
      ),
    );
  }
}
