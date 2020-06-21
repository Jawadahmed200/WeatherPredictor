import 'package:flutter/material.dart';



import '../services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weather=await WeatherModel().getLocationData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(locationWeather: weather,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 100.0,
          
        ),
      ),
    );
  }
}
