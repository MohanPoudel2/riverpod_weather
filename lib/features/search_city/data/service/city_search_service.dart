import 'package:retrofit/http.dart';
import 'package:riverpod_wheather_app/common/const/api_const.dart';

import '../model/search_city_result.dart';
import 'package:dio/dio.dart';
part 'city_search_service.g.dart';
@RestApi(baseUrl: ApiConst.citySearchBaseUrl)
abstract class CitySearchService {
  factory CitySearchService(Dio dio)=> _CitySearchService(dio);
  @GET(ApiConst.citySearchEndpoint)
  Future<SearchCityResult> searchCity({
    @Query('name') required String name,
    @Query('count') required int count,
    @Query('language') required String language,
    @Query('format') required String format,
  });
}
