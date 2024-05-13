import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/place.dart';
import 'package:qaida/components/search.dart';
import 'package:qaida/providers/recommendation.provider.dart';
import 'package:qaida/providers/user.provider.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().myself;
    final places = context.watch<RecommendationProvider>().places;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Search(),
      ),
      body: FutureBuilder(
        future: context
            .read<RecommendationProvider>()
            .getRecommendedPlaces(user.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              context.watch<RecommendationProvider>().places.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Рекомендуем',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        for (var place in places)
                          Place(place: place,),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// () async {
//   final location = await context.read<GeolocationProvider>().getLocation();
//   final user = context.watch<UserProvider>().myself;
//
//   context.read<GeolocationProvider>().connect();
//   context.read<GeolocationProvider>().sendLocation(
//     user.id,
//     location['lat'],
//     location['lon'],
//   );
//   context.read<GeolocationProvider>().close();
// }
