library forecast;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/models/weather/weather.dart';

part 'forecast.g.dart';
part 'forecast.freezed.dart';

// Forecast data parsed from API but not used in UI
@freezed
class Forecast with _$Forecast {
  factory Forecast({
    required List<Weather> list,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
