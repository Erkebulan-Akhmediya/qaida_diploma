import 'package:flutter/material.dart';
import 'package:qaida/components/place.dart';
import 'package:qaida/components/search.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Search(),
      ),
      body: Padding(
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
                children: const [
                  Place(), Place(), Place(),
                  Place(), Place(), Place(),
                  Place(), Place(), Place(),
                  Place(),
                ],
              ),
            ),
          ],
        ),
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
