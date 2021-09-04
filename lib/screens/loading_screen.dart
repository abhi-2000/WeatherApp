import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
   Location location=new Location();
   await location.getCurrentLocation();
   print(location.latitude);
   print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}