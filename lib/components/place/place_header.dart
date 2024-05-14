import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/place/place_image.dart';
import 'package:qaida/components/place/place_rating.dart';
import 'package:qaida/providers/place.provider.dart';

class PlaceHeader extends StatelessWidget {
  const PlaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final place = context.watch<PlaceProvider>().place;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          const PlaceImage(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Text(place?['title']),
                PlaceRating(
                  rating: double.parse(place?['score_2gis']['\$numberDecimal']),
                  reviewCount: List.from(place?['score']).length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
