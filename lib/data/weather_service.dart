// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;
  WeatherService({required this.apiKey});

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
      Uri.parse(
        '$BASE_URL?q=$cityName&appid=$apiKey&units=metric',
      ),
    );

    if (response.statusCode == 200) {
      return Weather.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception(
        'Failed to load Weather',
      );
    }
  }

  // get city from the device by asking permission

  Future getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // fetch the current location

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // convert location into list of placemark objects
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    // extract the city name from the first placemark

    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
