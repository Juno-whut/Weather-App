import 'dart:convert';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherService {
  // ignore: constant_identifier_names
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=imperial')); // try changing to imperial later
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      return Weather(cityName: 'Failed to load', temperature: 0, high: 0, low: 0, mainCondition: 'Failed to load', humidity: 0, windSpeed: 0);
    }
  }


  Future<String> getCurrentCity() async {
    // fetch the current location
    Position position = await Geolocator.getCurrentPosition(); 
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    
    // extract city name from the first placement mark
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      return place.locality ?? '';
    } else {
      return 'Failed to get city';
    }
  }
}

Future<void> getUserPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } 
}