import 'package:flutter/material.dart';
import 'package:qaida/components/place.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFA),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 30.0),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Вы смотрели'),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Place(),
                Place(),
                Place(),
                Place(),
                Place(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}