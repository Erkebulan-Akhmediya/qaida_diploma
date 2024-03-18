import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/geolocation.dart';
import 'package:qaida/providers/user.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final location = await context.read<GeolocationProvider>().getLocation();
          final user = await context.read<UserProvider>().getMe();
          print(location);
          print(user['_id']);
          await context.read<GeolocationProvider>().connect();
          // context.read<GeolocationProvider>().sendLocation(
          //   user['_id'],
          //   location['lat'],
          //   location['lon'],
          // );
          // await context.read<GeolocationProvider>().close();
        },
        child: const Text('Send Location'),
      ),
    );
  }
}