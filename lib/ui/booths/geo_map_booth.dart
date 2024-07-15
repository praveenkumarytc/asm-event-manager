import 'package:event_app/helper/navigator_method.dart';
import 'package:event_app/helper/show_toast.dart';
import 'package:event_app/helper/sized_box.dart';
import 'package:event_app/models/all_booth_list_model.dart';
import 'package:event_app/provider/home_provider.dart';
import 'package:event_app/ui/auth/components/asm_button.dart';
import 'package:event_app/utils/app_constants.dart';
import 'package:event_app/utils/asset_images.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_select/camera_image_pick.dart';
import 'package:provider/provider.dart';

class BoothGeoLocation extends StatefulWidget {
  const BoothGeoLocation({super.key, required this.booth});
  final Booth booth;

  @override
  State<BoothGeoLocation> createState() => _BoothGeoLocationState();
}

class _BoothGeoLocationState extends State<BoothGeoLocation> {
  late GoogleMapController mapController;
  LatLng? userLocation;
  LatLng? boothLocation;
  Marker? boothMarker;
  LatLng? newLocation;

  BitmapDescriptor? customIcon;

  void _loadCustomIcon() async {
    customIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      Images.eventMapIcon,
    );
    _initializeLocation();
  }

  @override
  void initState() {
    super.initState();

    _loadCustomIcon();
  }

  Future<void> _initializeLocation() async {
    if (widget.booth.boothLatitude != null && widget.booth.boothLongitude != null) {
      boothLocation = LatLng(
        double.parse(widget.booth.boothLatitude!),
        double.parse(widget.booth.boothLongitude!),
      );

      newLocation = boothLocation;
      boothMarker = Marker(
        markerId: const MarkerId('booth_location'),
        position: boothLocation!,
        infoWindow: InfoWindow(title: widget.booth.boothName ?? 'Booth'),
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
        onTap: () {
          setState(() {
            newLocation = boothLocation;
          });
          // _selectNewLocation();
        },
      );
    } else {
      Position position = await _getUserLocation();

      userLocation = LatLng(position.latitude, position.longitude);
      newLocation = userLocation;
      boothMarker = Marker(
        markerId: const MarkerId('user_location'),
        position: userLocation!,
        icon: customIcon ?? BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: widget.booth.name),
        onTap: () {
          setState(() {
            newLocation = userLocation;
          });
          // _selectNewLocation();
        },
      );
    }
    setState(() {});
  }

  Future<Position> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
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
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  void _selectNewLocation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select New Location'),
        content: const Text('Tap on the map to select a new location for the booth.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _updateBoothLocation() async {
    if (newLocation != null) {
      String lat = newLocation!.latitude.toString();
      String lng = newLocation!.longitude.toString();
      int boothId = widget.booth.boothId!;
      CustomLoader.show(context);
      await Provider.of<HomeProvider>(context, listen: false).upadateBoothLatLng(context, lat, lng, boothId).then((response) {
        CustomLoader.hide(context);
        if (response?.status == AppConstants.success) {
          showErrorSnackBar(context, response?.message, isError: false);
          popBack(context);
        } else {
          showErrorSnackBar(context, response?.message);
        }
      });
    } else {
      showErrorSnackBar(context, 'Please select a location on the map.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.booth.boothName ?? 'Booth Location'),
      ),
      body: Column(
        children: [
          if (boothLocation == null && userLocation == null)
            const SizedBox(
              height: 500,
              child: Center(child: const ProgressBar()),
            )
          else
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: boothLocation ?? userLocation!,
                  zoom: 17,
                ),
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                markers: {
                  if (boothMarker != null) boothMarker!,
                },
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                onTap: (LatLng latLng) {
                  setState(() {
                    newLocation = latLng;
                    boothMarker = Marker(
                      markerId: const MarkerId('booth_location'),
                      position: newLocation!,
                      icon: customIcon ?? BitmapDescriptor.defaultMarker,
                      infoWindow: InfoWindow(title: widget.booth.boothName ?? 'Booth'),
                      onTap: () {
                        _selectNewLocation();
                      },
                    );
                  });
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 135,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (newLocation?.latitude == null) SizedBox(height: 50, width: 50, child: ProgressBar()),
            if (newLocation?.latitude != null) ...[
              Text("Latitude: ${newLocation?.latitude.toStringAsFixed(5) ?? ''}", style: subHeadingBold),
              Text("Longitude: ${newLocation?.longitude.toStringAsFixed(5) ?? ''}", style: subHeadingBold),
            ],
            5.heightBox,
            AsmButtonButton(
              onTap: _updateBoothLocation,
              child: const Text(
                'Update Booth Location',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
