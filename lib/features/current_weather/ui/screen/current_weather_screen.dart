import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wheather_app/features/current_weather/data/current_weather_model.dart';
import 'package:riverpod_wheather_app/features/current_weather/provider/current_weather_provider.dart';
import 'package:riverpod_wheather_app/features/current_weather/provider/state/current_weather_state.dart';

import '../widget/current_weather_widget.dart';

class CurrentWeatherScreen extends ConsumerStatefulWidget {
  const CurrentWeatherScreen(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.city});

  final String latitude;
  final String longitude;
  final String city;

  @override
  ConsumerState<CurrentWeatherScreen> createState() =>
      _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends ConsumerState<CurrentWeatherScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getWeather();
  }

  @override
  Widget build(BuildContext context) {
    final currentWeatherState = ref.watch(currentWeatherProvider);
    return Scaffold(
        body: Stack(
      children: [
        _weatherWidget(currentWeatherState),
        SafeArea(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)))
      ],
    ));
  }

  void _getWeather() async {
    await Future.delayed(Duration.zero);
    ref
        .read(currentWeatherProvider.notifier)
        .getWeather(latitude: widget.latitude, longitude: widget.longitude);
  }

  Widget _weatherWidget(CurrentWeatherState currentWeatherState) {
    return switch (currentWeatherState) {
      CurrentWeatherLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
      CurrentWeatherSuccess(currentWeatherModel: CurrentWeatherModel current) =>
        CurrentWeatherWidget(widget: widget, current: current),
      CurrentWeatherFailed(errorMessage: String error) => Center(
          child: Text(error),
        )
    };
  }
}
