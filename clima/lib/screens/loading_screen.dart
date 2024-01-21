import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';



class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? longitude;
  double? latitude;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocaionAsy();

  }

  void getlocaionAsy() async{
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();


  Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather :weatherData)));

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
        ),
      ),
    );
  }
}