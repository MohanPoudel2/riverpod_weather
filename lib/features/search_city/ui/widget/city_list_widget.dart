import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_wheather_app/features/search_city/data/model/search_city_result.dart';

import 'cached_network_image_widget.dart';

class CityListWidget extends StatelessWidget {
  const CityListWidget({super.key, required this.searchCityResult});

  final SearchCityResult searchCityResult;

  @override
  Widget build(BuildContext context) {
    List<Results>? cities = searchCityResult.results;
    return ListView.builder(
      itemCount: cities?.length ?? 0,
      itemBuilder: (context, index) {
        Results? results = cities?[index];
        return InkWell(
          onTap: () {
            context.push('/current', extra: {
              'lati': results?.latitude.toString(),
              'longi': results?.longitude.toString(),
              'city' : results?.name
            });
          },
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(results?.name ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(results?.country ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(results?.admin1 ?? ''),
                    )
                  ],
                ),
                CachedNetworkImageWidget(results: results),
              ],
            ),
          ),
        );
      },
    );
  }
}
