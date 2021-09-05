
import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = '0d9d7c1ec15e4df72bbfdfeb1dac6579';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;
    NetworkHelper networkHelper=new NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData= await networkHelper.getData();
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);

    }));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
// double temperature = decodedDate['main']['temp'];
// int condition = decodedDate['weather'][0]['id'];
// String cityName = decodedDate['name'];
// print(temperature);
// print(condition);
// print(cityName);