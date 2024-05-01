// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  final String cityName;
  final double temp;
  final String mainCondition;
  Weather({
    required this.cityName,
    required this.temp,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temp: (json['main']['temp'] as double).toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
