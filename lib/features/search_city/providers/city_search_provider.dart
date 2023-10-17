import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wheather_app/common/providers/dio/dio_provider.dart';
import 'package:riverpod_wheather_app/features/search_city/data/model/search_city_result.dart';
import 'package:riverpod_wheather_app/features/search_city/data/service/city_search_service.dart';
import 'package:riverpod_wheather_app/features/search_city/providers/state/search_city_state.dart';
import 'package:dio/dio.dart';

class CitySearchProvider extends Notifier<CitySearchState> {
  CitySearchState citySearchState = CitySearchLoading();

  @override
  build() {
    return citySearchState;
  }

  late final Dio _dio = ref.read(dioProvider);
  late final CitySearchService _citySearchService = CitySearchService(_dio);

  void searchCity(String name) async {
    SearchCityResult searchCityResult = await _citySearchService.searchCity(
        name: name, count: 10, language: 'en', format: 'json');
  }
}
