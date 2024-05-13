import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/place_card/place_card_image.dart';
import 'package:qaida/providers/place.provider.dart';
import 'package:qaida/views/place.dart';

class PlaceCard extends StatelessWidget {
  final Map? place;

  const PlaceCard({super.key, this.place});

  String categories(List categories) {
    try {
      String res = '';
      for (var category in categories) {
        res = '$res, ${category['name']}';
      }
      return res.substring(2);
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (place == null) return;
        context.read<PlaceProvider>().setId(place!['_id']);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Place(),
          ),
        );
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceCardImage(place: place),
            Text(
              place == null ? 'Хан шатыр' : place!['title'],
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              place == null
                  ? 'Торгово-развлекательный центр'
                  : categories(place!['category_id']),
              style: const TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              place == null ? 'Проспект Туран, 37' : place!['address'] ?? '',
              style: const TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
