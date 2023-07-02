// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/weather/weather_data.dart';
import 'hourly_weather_controller.dart';

class HourlyWeather extends ConsumerWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastDataValue = ref.watch(hourlyWeatherControllerProvider);

    return forecastDataValue.when(
        data: (forecastData) {
          // API returns data points in 3-hour intervals -> 1 day = 8 intervals
          final items = [0, 8, 16, 24, 32];
          return HourlyWeatherRow(
            weatherDataItems: [
              for (var i in items) forecastData.list[i],
            ],
          );
        },
        error: (e, __) => Text(e.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

class HourlyWeatherRow extends StatelessWidget {
  const HourlyWeatherRow({
    Key? key,
    required this.weatherDataItems,
  }) : super(key: key);

  final List<WeatherData> weatherDataItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: weatherDataItems
          .map((data) => HourlyWeatherItem(data: data))
          .toList(),
    );
  }
}

class HourlyWeatherItem extends ConsumerWidget {
  const HourlyWeatherItem({
    super.key,
    required this.data,
  });
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final temp = data.temp.celsius.toInt().toString();

    return Expanded(
      child: Column(
        children: [
          Text(
            DateFormat.E().format(data.date),
            style: textTheme.bodySmall!.copyWith(fontWeight: fontWeight),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            temp,
            style: textTheme.bodyLarge!.copyWith(fontWeight: fontWeight),
          )
        ],
      ),
    );
  }
}
