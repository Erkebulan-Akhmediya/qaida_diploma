import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  final Map? place;

  const Place({super.key, this.place});

  String categories(List categories) {
    String res = '';
    for (var category in categories) {
      res = '$res, ${category['name']}';
    }
    return res.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: place == null || place!['image'] == null
                  ? const DecorationImage(
                      image: AssetImage('assets/sample.jpg'),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: NetworkImage(place!['image']),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
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
    );
  }
}
