import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/weather_service.dart';

import 'models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
// api key
  final _weatherService =
      WeatherService(apiKey: "d159ff45d6711d7f86705f178e02d9e7");
  Weather? _weather;
// fetch weather

  _fetchWeather() async {
    // get the current city

    String cityName = await _weatherService.getCurrentCity();

// get weather for this city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(
        () {
          _weather = weather;
        },
      );
    } catch (e) {
      print(e);
    }
  }
// weather animations

// init state

  @override
  void initState() {
    super.initState();

    // fetch weather

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name,
            Text(_weather?.cityName ?? 'loading city...'),

            // animation,

            Image.asset(
              'assets/images/sunny.gif',
              fit: BoxFit.cover,
              height: 320,
            ),
            // temp,
            Text('${_weather?.temp.round()}°C'),
          ],
        ),
      ),
    );
  }
}
