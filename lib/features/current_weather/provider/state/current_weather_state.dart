import 'package:riverpod_wheather_app/features/current_weather/data/current_weather_model.dart';

sealed class CurrentWeatherState{}

class CurrentWeatherLoading extends CurrentWeatherState{}
class CurrentWeatherSuccess extends CurrentWeatherState{
  final CurrentWeatherModel currentWeatherModel;

  CurrentWeatherSuccess(this.currentWeatherModel);
}
class CurrentWeatherFailed extends CurrentWeatherState{
  final String errorMessage;

  CurrentWeatherFailed(this.errorMessage);

}