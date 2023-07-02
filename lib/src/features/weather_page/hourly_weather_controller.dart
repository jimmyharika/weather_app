import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/weather_repository.dart';
import '../../models/forecast/forecast_dart.dart';
import 'city_searchbox.dart';

class HourlyWeatherController extends StateNotifier<AsyncValue<ForecastData>> {
  HourlyWeatherController(this._weatherRepository, {required String city})
      : super(const AsyncValue.loading()) {
    getWeather(city: city);
  }
  final HttpWeatherRepository _weatherRepository;

  Future<void> getWeather({required String city}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final forecast = await _weatherRepository.getForecast(city: city);
      return ForecastData.from(forecast);
    });
  }
}

final hourlyWeatherControllerProvider = StateNotifierProvider.autoDispose<
    HourlyWeatherController, AsyncValue<ForecastData>>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  final city = ref.watch(cityProvider);
  return HourlyWeatherController(weatherRepository, city: city);
});
