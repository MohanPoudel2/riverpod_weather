
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/model/search_city_result.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.results,
  });

  final Results? results;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://flagsapi.com/${results?.countryCode}/flat/64.png",
      width: 64,
      height: 64,
      placeholder: (_, __) => const CircularProgressIndicator(),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
    );
  }
}
