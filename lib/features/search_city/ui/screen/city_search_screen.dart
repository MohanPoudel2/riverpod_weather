import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_wheather_app/features/search_city/data/model/search_city_result.dart';
import 'package:riverpod_wheather_app/features/search_city/providers/state/search_city_state.dart';
import 'package:riverpod_wheather_app/features/search_city/ui/widget/city_list_widget.dart';
import 'package:riverpod_wheather_app/features/theme/provider/theme_provider.dart';
import 'package:riverpod_wheather_app/features/theme/provider/theme_state.dart';

import '../../providers/city_search_provider.dart';

class CitySearchScreen extends ConsumerStatefulWidget {
  const CitySearchScreen({super.key});

  @override
  ConsumerState<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<CitySearchScreen> {
  final TextEditingController _citySearchTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final citySearchState = ref.watch(citySearchProvider);
    final provider=ref.read(citySearchProvider.notifier);
    final weatherTheme=ref.watch(themeProvider);
    final weatherThemeProvider=ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpot Weather'),
        centerTitle: true,
        actions: [
          Switch(value: (weatherTheme is DarkTheme), onChanged: (val){
            if(!val){
              weatherThemeProvider.changeTheme(LightTheme());
            }else{
              weatherThemeProvider.changeTheme(DarkTheme());
            }
          })
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.url,
              controller: _citySearchTextController,
              onSubmitted: (str){
                if(str.isNotEmpty){
                  provider.searchCity(str);
                }
              },
              decoration:  InputDecoration(
                  labelText: 'Please enter your city name',
                  suffixIcon: IconButton(onPressed: (){
                    String city=_citySearchTextController.text.trim();
                    if(city.isEmpty){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content:  Text('Please enter your city name')));
                    }else{
                     provider.searchCity(city);
                    }
                  }, icon: const Icon(Icons.search)),
                  border: const OutlineInputBorder()),
            ),
          ),
          Expanded(child: _citySearchResultWidget(citySearchState))
        ],
      ),
    );
  }
  Widget _citySearchResultWidget(CitySearchState citySearchState){
    return Center(
      child: switch(citySearchState){
        CitySearchForm()=>const Text('Please select a city'),
      CitySearchLoading()=>const CircularProgressIndicator(),
      CitySearchSuccess(searchCityResult:SearchCityResult searchCityResult)=>CityListWidget(searchCityResult: searchCityResult),
      CitySearchFailed(errorMessage:String error)=> Text(error)

      }
    );
  }

}
