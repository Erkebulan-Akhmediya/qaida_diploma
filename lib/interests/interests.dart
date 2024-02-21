import 'package:flutter/material.dart';
import 'package:qaida/components/interest_item.dart';

class Interests extends StatelessWidget {
  final List interest;

  const Interests({super.key, required this.interest});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 20.0,
        right: 20.0,
      ),
      children: <Widget>[
        const Text(
          'Выберите интересы',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
        const Text(
          'Это поможет нам составлять более точные рекомендации для посещения',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        for (var i in interest) InterestItem(text: i['name']),
      ],
    );
  }
}