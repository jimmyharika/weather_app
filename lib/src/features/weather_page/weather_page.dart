// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/src/data/app_colors.dart';
import 'package:weather_app/src/features/weather_page/city_searchbox.dart';
import 'package:weather_app/src/features/weather_page/hourly_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({
    Key? key,
    required this.city,
  }) : super(key: key);
  final String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: AppColors.rainGradient,
          ),
        ),
        child: SafeArea(
          child: const Column(
            children: [
              Spacer(),
              CitySearchBox(),
              Spacer(),
              HourlyWeather(),
              Spacer(),
              // CurrentWeather()
              // HourlyWeather()
            ],
          ),
        ),
      ),
    );
  }
}
