import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/styles.dart';

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({super.key, required Weather? weather}) : _weather = weather;
  final Weather? _weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: MediaQuery.sizeOf(context).height * 0.15,
      decoration: BoxDecoration
      (color: Colors.lightBlueAccent, 
      borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("High: ${_weather?.high.round()}°F",
              style: weatherStatsStyle
              ),
              Text("Low: ${_weather?.low.round()}°F",
              style: weatherStatsStyle
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Wind: ${(_weather?.windSpeed != null ? _weather!.windSpeed * 2.23694 : 0).toStringAsFixed(0)} mph",
              style: weatherStatsStyle
              ),
              Text("Humidity: ${_weather?.humidity.round()}%",
              style: weatherStatsStyle
              ),
            ],
          ),
        ],
      ),
    );
  }
}