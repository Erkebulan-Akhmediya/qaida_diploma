import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/geolocation.provider.dart';
import 'package:qaida/providers/user.provider.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final location = await context.read<GeolocationProvider>().getLocation();
          final user = context.watch<UserProvider>().myself;

          context.read<GeolocationProvider>().connect();
          context.read<GeolocationProvider>().sendLocation(
            user.id,
            location['lat'],
            location['lon'],
          );
          context.read<GeolocationProvider>().close();
        },
        child: const Text('Send Location'),
      ),
    );
  }
}