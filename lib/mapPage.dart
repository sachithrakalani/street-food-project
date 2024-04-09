import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;
  final LatLng _centerSriLanka = const LatLng(7.8731, 80.7718);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _zoomIn() {
    mapController?.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut() {
    mapController?.animateCamera(CameraUpdate.zoomOut());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Google Map',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _centerSriLanka,
                    zoom: 7.0,
                  ),
                  gestureRecognizers: Set()
                    ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
                  markers: {
                    const Marker(
                      markerId: MarkerId('Kibulawala'),
                      position: LatLng(6.8759, 79.9293),
                      infoWindow: InfoWindow(
                        title: "Kibulawala",
                        snippet: "Street food",
                      ),
                    ),
                    const Marker(
                      markerId: MarkerId('Aluthkade'),
                      position: LatLng(6.9378, 79.8631),
                      infoWindow: InfoWindow(
                        title: "Aluthkade",
                        snippet: "Street food",
                      ),
                    ),
                    const Marker(
                      markerId: MarkerId('Galle Fort'),
                      position: LatLng(6.0252, 80.2161),
                      infoWindow: InfoWindow(
                        title: "Galle Fort",
                        snippet: "Street food",
                      ),
                    ),
                  },
                ),
              ),
              Positioned(
                top: 26,
                right: 16,
                child: FloatingActionButton(
                  onPressed: _zoomIn,
                  child: Icon(Icons.add),
                ),
              ),
              Positioned(
                top: 26,
                right: 82,
                child: FloatingActionButton(
                  onPressed: _zoomOut,
                  child: Icon(Icons.remove),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
