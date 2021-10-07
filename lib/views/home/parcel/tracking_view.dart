import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class TrackingView extends StatefulWidget {
  String pickupLat;
  String pickupLong;
  String dropLat;
  String dropLong;
  TrackingView({this.pickupLat,this.pickupLong,this.dropLat,this.dropLong});
  @override
  _TrackingViewState createState() => _TrackingViewState();
}

class _TrackingViewState extends State<TrackingView> {

  final Set<Polyline> polyline = {};
  GoogleMapController _controller;
  List<LatLng> result;
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline();
  String googleAPiKey = "AIzaSyCzR_FsofOqqU-YF4Ga_m9LUBTFWUwX9lY";




  getSomePoints() async {
    var permission = Permission.location.status;
    print('........................................................................................................................................................................................Location permission ${permission}');
    if(await Permission.location.isGranted){
      // Use location.
      result = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(double.parse(widget.pickupLat),double.parse(widget.pickupLong)),
          destination: LatLng(double.parse(widget.pickupLat),double.parse(widget.pickupLong)),
          mode:  RouteMode.driving
      );
    }
    else{
      await Permission.location.request();
    }




  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSomePoints();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: onMapCreated,
        polylines: polyline,
        initialCameraPosition: CameraPosition(target: LatLng(double.parse(widget.pickupLat),double.parse(widget.pickupLong)),
        zoom: 14
        ),
          mapType: MapType.normal,
      ),
    );
  }
  void onMapCreated(GoogleMapController controller){
    _controller = controller;
    polyline.add(Polyline(polylineId: PolylineId('route1'),
    visible: true,
      points: result,
      width: 4,
      color: Colors.blue,
      startCap: Cap.roundCap,
      endCap: Cap.buttCap
    ));
  }
}
