import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/favorite_item.dart';
import 'package:qaida/providers/user.provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Избранные')),
      body: FutureBuilder(
        future: context.read<UserProvider>().getFavPlaces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ошибка. Попробуйте позже')),
            );
            return Container();
          } else {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4/3,
              children: [
                for (var place in snapshot.data) FavoriteItem(place: place),
              ],
            );
          }
        },
      ),
    );
  }
}
