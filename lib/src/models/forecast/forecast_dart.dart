// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/src/models/forecast/forecast.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';

class ForecastData {
  final List<WeatherData> list;
  const ForecastData(this.list);

  factory ForecastData.from(Forecast forecast) {
    return ForecastData(
      forecast.list.map((item) => WeatherData.from(item)).toList(),
    );
  }
}
