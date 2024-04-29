import 'package:flutter/material.dart';
import 'package:qaida/components/profile/app_bar/info_button.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        InfoButton(icon: Icons.bookmark, text: 'Избранные', count: 2),
        InfoButton(icon: Icons.place, text: 'Посетил(-а)', count: 2),
        InfoButton(icon: Icons.message, text: 'Отзывы', count: 2),
      ],
    );
  }
}