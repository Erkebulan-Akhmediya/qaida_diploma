import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  const Place({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network('https://www.architime.ru/specarch/foster_and_partners_1/2.jpg'),
      ],
    );
  }
}