import 'package:flutter/material.dart';
import 'package:qaida/components/profile/history/place.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          const Text('Вы смотрели'),
          ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              Place(),
            ],
          ),
        ],
      ),
    );
  }
}