import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/search.dart';
import 'package:qaida/providers/auth.provider.dart';
import 'package:qaida/views/home/authorized_home.dart';
import 'package:qaida/views/home/unauthorized_home.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Search()),
      body: context.watch<AuthProvider>().isAuthorized
          ? const AuthorizedHome()
          : const UnauthorizedHome(),
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
