import 'package:couries_one/configs/constants/app_constants.dart';
import 'package:couries_one/configs/styles/app_colors.dart';
import 'package:couries_one/configs/styles/app_decor.dart';
import 'package:couries_one/controllers/location/location_controller.dart';
import 'package:couries_one/controllers/recipient.dart';
import 'package:couries_one/views/home/parcel/place_order_view.dart';
import 'package:couries_one/widgets/custom_app_bar.dart';
import 'package:couries_one/widgets/custom_text_field.dart';
import 'package:couries_one/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';


class AddLocationScreen extends StatefulWidget {
  String destination;
  int index;
  AddLocationScreen({this.destination, this.index});
  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  final RecipientController _recipientController = Get.put(RecipientController());
  GoogleMapController _mapController;
  String searchAddr;
  String location;
  String address;
  List<Marker> myMarker = [];

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(LatLng position) async{
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    print(place);
    address = '${place.name}, ${place.street},${place.country}, ${place.postalCode}';
    print(address);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [

            CustomAppBar(title: "Enter Destination",),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.search,size: 20,),
                    onPressed: searchandNavigate,

                    ),
                    SizedBox(width: 10,),
                    Expanded(child: TextField(
                      onChanged: (val){
                        searchAddr = val;
                      },
                    ))
                  ],
                )
            ),
            SizedBox(height: 20,),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: ContainerDecor.BorderRadius1
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:BorderRadius.only(topLeft: Radius.circular(40),),
                      child: GoogleMap(
                        onMapCreated: onMapCreated,
                        initialCameraPosition: CameraPosition(
                        target: LatLng(22.5448131, 88.3403691),
                        zoom: 15,

                      ),
                      markers: Set.from(myMarker),
                      onTap: _handleTap,
                      ),

                    ),
                    Positioned(
                        bottom: 0,
                        right: 12,
                        left: 12,

                        child: FullWidthButton(
                          noCurve: true,
                      text: "Add Location",
                      onTap: (){
                            if (widget.index == 1){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => PlaceOrderScreen(address:address,address1: widget.destination,)));
                            }
                            else{
                              Navigator.push(context,MaterialPageRoute(builder: (context) => PlaceOrderScreen(address:widget.destination,address1: address,)));
                            }
                      },
                    ))
                  ],

                ),
            ),



        ),
        ]
      ),
    )
    );
  }

  searchandNavigate() {
    locationFromAddress(searchAddr).then((result) {
      _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 17,
      )));
    });
  }

  void onMapCreated (controller){
    setState(() {
      _mapController = controller;
    });
  }

  _handleTap(LatLng tappedPoint)async{
    location = 'Lat: ${tappedPoint.latitude}, Long: ${tappedPoint.longitude}';

    GetAddressFromLatLong(tappedPoint);
    print(tappedPoint.latitude);
    print(tappedPoint.longitude);
    if(widget.index == 1){
      _recipientController.pickupLat.value = tappedPoint.latitude.toString();
      _recipientController.pickupLong.value = tappedPoint.longitude.toString();
    }
    else{
      _recipientController.dropLat.value = tappedPoint.latitude.toString();
      _recipientController.dropLong.value = tappedPoint.longitude.toString();
    }

    print(location);
    setState(() {
      myMarker = [];
      myMarker.add(
        Marker(markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
          draggable: true,
          onDragEnd: (dragEndPosition){
          print(dragEndPosition);
          }
        )
      );
    });
  }
}


