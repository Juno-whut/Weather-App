import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/styles.dart';
import 'package:weather_app/secrets/api_key.dart';
import 'package:weather_app/widgets/extra_info.dart';


class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  // aip key
  final _weatherService = WeatherService(OPENWEATHERAPIKEY);

  String cityName = 'Loading City. . .';
  Weather? _weather;
  TextEditingController searchBarController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  // fetch weather
  Future<void>_fetchWeather() async {
    // get current city
    try {
      String city = await _weatherService.getCurrentCity();
      setState((){
        cityName = city;
      });
      }
    catch (e) {
      throw Exception(e);
    }
  
    // get weather for current city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    // any errors
    catch (e) {
      throw Exception(e);
    }
  }


  // get weather from search
  Future<void> getWeatherFromSearch(String cityName) async {
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    // any errors
    catch (e) {
      throw Exception(e);
    }
  }


  // weather animations
    String getWeatherAnimation(String? mainCondition) {
      if (mainCondition == null) return 'assets/sunny.json'; // default animation

      switch (mainCondition.toLowerCase()) {
        case 'clouds':
        case 'mist':
        case 'fog':
        case 'haze':
        case 'smoke':
        case 'dust':
          return 'assets/windy.json';
        case 'rain':
        case 'drizzle':
        case 'shower rain':
        case 'light intensity drizzle':
        case 'heavy intensity drizzle':
        case 'light intensity drizzle rain':
        case 'drizzle rain':
        case 'heavy intensity drizzle rain':
        case 'shower rain and drizzle':
        case 'heavy shower rain and drizzle':
        case 'shower drizzle':
        case 'light rain':
        case 'moderate rain':
        case 'heavy intensity rain':
        case 'very heavy rain':
        case 'extreme rain':
        case 'freezing rain':
        case 'light intensity shower rain':
        case 'heavy intensity shower rain':
        case 'ragged shower rain':
          return 'assets/rain.json';
        case 'thunderstorm':
        case 'thunderstorm with light rain':
        case 'thunderstorm with rain':
        case 'thunderstorm with heavy rain':
        case 'light thunderstorm':
        case 'heavy thunderstorm':
        case 'ragged thunderstorm':
        case 'thunderstorm with light drizzle':
        case 'thunderstorm with drizzle':
        case 'thunderstorm with heavy drizzle': 
          return 'assets/thunder.json';
        case 'light snow':
        case 'snow':
        case 'heavy snow':
        case 'sleet':
        case 'light shower sleet':
        case 'shower sleet':
        case 'light rain and snow':
        case 'rain and snow':
        case 'light shower snow':
        case 'shower snow':
        case 'heavy shower snow':
          return 'assets/snow.json';
        case 'few clouds':
        case 'scattered clouds':
        case 'broken clouds':
        case 'overcast clouds':
          return 'assets/partiallycloudy.json';
        case 'clear sky':
          return 'assets/sunny.json';
        default:
          return 'assets/sunny.json';
      }
    }


  void onSearchSubmitted(String value) {
    if (value.isEmpty) return;
    setState(() {
      cityName = value;
    });
    searchBarController.clear();
    getWeatherFromSearch(cityName);
  }


  void getLocationAndWeather() async {
    await getUserPermission();
    _fetchWeather();
  }

  // init state
  @override
  void initState() {
    super.initState();
    // get user permission and Weather
    getLocationAndWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[700],
        title: TextField(
          controller: searchBarController,
          cursorColor: Colors.white,
          focusNode: searchFocusNode,
          style: titleStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: cityName,
            hintStyle: titleStyle,
            suffixIcon: const Icon(Icons.search, color: Colors.white, size: 40, weight: 40,),
          ),
          autocorrect: true,
          onSubmitted: onSearchSubmitted,
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () => _fetchWeather(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
              // animation
              Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            
              // temperature
              Text('${_weather?.temperature.round()}°F',
              style: titleStyle
              ),
              
              // main description
              Text(_weather?.mainCondition ?? "",
              style: mainConditionStyle
              ),
            
              // extra space
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),

              // other weather stats
              ExtraInfo(weather: _weather),  
              ],
            ),
          ),
        ),
      ), 
    );
  }
}