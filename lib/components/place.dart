import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/template.provider.dart';

class Place extends StatelessWidget {
  final Map? place;

  const Place({super.key, this.place});

  String categories(List categories) {
    try {
      String res = '';
      for (var category in categories) {
        res = '$res, ${category['name']}';
      }
      return res.substring(2);
    } catch(e) {
      return '';
    }
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
          FutureBuilder<bool>(
            future:
                context.read<TemplateProvider>().isValidImgUrl(place?['image']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  width: 200,
                  height: 90,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Container(
                width: 200,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: place == null ||
                          place!['image'] == null ||
                          !snapshot.data!
                      ? const DecorationImage(
                          image: AssetImage('assets/sample.jpg'),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: NetworkImage(place!['image']),
                          fit: BoxFit.cover,
                        ),
                ),
              );
            },
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
