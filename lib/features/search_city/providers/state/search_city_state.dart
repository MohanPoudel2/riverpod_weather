import 'package:riverpod_wheather_app/features/search_city/data/model/search_city_result.dart';

sealed class CitySearchState {}

class CitySearchLoading extends CitySearchState {}

class CitySearchForm extends CitySearchState {}

class CitySearchSuccess extends CitySearchState {
  final SearchCityResult searchCityResult;

  CitySearchSuccess(this.searchCityResult);
}

class CitySearchFailed extends CitySearchState {
  final String errorMessage;

  CitySearchFailed(this.errorMessage);
}
