import 'package:retrofit/http.dart';
import 'package:riverpod_wheather_app/common/const/api_const.dart';

import '../current_weather_model.dart';
import 'package:dio/dio.dart';

part 'current_weather_service.g.dart';

@RestApi(baseUrl: ApiConst.weatherBaseUrl)
abstract class CurrentWeatherService {
  factory CurrentWeatherService(Dio dio) => _CurrentWeatherService(dio);

  @GET(ApiConst.forecastEndpoint)
  Future<CurrentWeatherModel> getCurrentWeather({
    @Query('latitude') required String latitude,
    @Query('longitude') required String longitude,
    @Query('current_weather') required bool currentWeather,
  });
}
