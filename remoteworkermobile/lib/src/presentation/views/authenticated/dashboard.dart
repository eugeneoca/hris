import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
// import 'package:location/location.dart';
import 'package:remoteworkermobile/src/core/constants.dart';
import 'package:remoteworkermobile/src/presentation/views/widgets/custom_text.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Future<void> _capturePhotoAndLocation() async {
    // Capture the photo using the front camera
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (photo != null) {
      print('Photo captured: ${photo.path}');

      // Get the current location
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      // Check if location services are enabled
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          // Location services are not enabled, don't continue
          print('Location services are disabled.');
          return;
        }
      }

      // Check for location permissions
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          // Permissions are denied, don't continue
          print('Location permissions are denied');
          return;
        }
      }

      if (_permissionGranted == PermissionStatus.deniedForever) {
        // Permissions are permanently denied, don't continue
        print('Location permissions are permanently denied');
        return;
      }

      // Get the current position
      _locationData = await location.getLocation();
      print(
          'Current location: ${_locationData.latitude}, ${_locationData.longitude}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.mainColor,
        title: const CustomText(
          text: "HRIS Remote Worker",
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 19,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle(),
                    Wrap(
                      children: [
                        buildTimeIn(),
                        buildTimeOut(),
                        buildUploadAllLogs()
                      ],
                    ),
                  ],
                ),
                const Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomText(
                      text: "v1.0.0",
                      fontSize: 15,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const CustomText(
        text: "Hello, Rhico!",
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildTimeIn() {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => _capturePhotoAndLocation(),
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: Colors.red,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "TIME IN",
                  fontSize: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTimeOut() {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => _capturePhotoAndLocation(),
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.red,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "TIME OUT",
                  fontSize: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUploadAllLogs() {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {},
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.red,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "UPLOAD RECORDS",
                  fontSize: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
