import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wheather_app/common/providers/dio/dio_provider.dart';
import 'package:riverpod_wheather_app/features/current_weather/data/current_weather_model.dart';
import 'package:riverpod_wheather_app/features/current_weather/data/service/current_weather_service.dart';
import 'package:riverpod_wheather_app/features/current_weather/provider/state/current_weather_state.dart';
import 'package:dio/dio.dart';

class CurrentWeatherProvider extends Notifier<CurrentWeatherState> {
  final CurrentWeatherState _currentWeatherState = CurrentWeatherLoading();

  @override
  CurrentWeatherState build() {
    return _currentWeatherState;
  }

  late final Dio _dio = ref.read(dioProvider);

  void getWeather({
    required String latitude,
    required String longitude,
  }) async {
    try {
      state = CurrentWeatherLoading();
      CurrentWeatherService currentWeatherService = CurrentWeatherService(_dio);
      CurrentWeatherModel currentWeatherModel =
          await currentWeatherService.getCurrentWeather(
              latitude: latitude, longitude: longitude, currentWeather: true);
      state = CurrentWeatherSuccess(currentWeatherModel);
    } catch (e) {
      state = CurrentWeatherFailed(e.toString());
    }
  }
}

final currentWeatherProvider =
    NotifierProvider<CurrentWeatherProvider, CurrentWeatherState>(
        () => CurrentWeatherProvider());
