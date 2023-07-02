// ignore_for_file: public_member_api_docs, sort_constructors_first
// Derived model class used in UI

import 'package:weather_app/src/models/weather/temperature.dart';
import 'package:weather_app/src/models/weather/weather.dart';

class WeatherData {
  final Temperature temp;
  final Temperature minTemp;
  final Temperature maxTemp;
  final String description;
  final DateTime date;
  final String icon;
  WeatherData({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.icon,
  });

  factory WeatherData.from(Weather weather) {
    return WeatherData(
      temp: Temperature.celsius(weather.weatherParams.temp),
      minTemp: Temperature.celsius(weather.weatherParams.tempMin),
      maxTemp: Temperature.celsius(weather.weatherParams.tempMax),
      description: weather.weatherInfo[0].description,
      date: DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000),
      icon: weather.weatherInfo[0].icon,
    );
  }

  String get iconUrl => "https://openweathermap.org/img/wn/$icon@2x.png";
}
