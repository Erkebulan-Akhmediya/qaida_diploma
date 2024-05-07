import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/profile/app_bar/info_button.dart';
import 'package:qaida/providers/user.provider.dart';
import 'package:qaida/views/profile/reviews.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().myself;
    final visitedCount = context.watch<UserProvider>().visitedCount;
    return Row(
      children: [
        InfoButton(
          icon: Icons.bookmark,
          text: 'Избранные',
          count: user.favorites.length,
        ),
        InfoButton(
          icon: Icons.place,
          text: 'Посетил(-а)',
          count: visitedCount,
        ),
        const InfoButton(
          icon: Icons.message,
          text: 'Отзывы',
          count: -1,
          page: Reviews(),
        ),
      ],
    );
  }
}
