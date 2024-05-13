import 'package:flutter/material.dart';
import 'package:qaida/components/place_card/place_card.dart';

class MightBeInteresting extends StatelessWidget {
  const MightBeInteresting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Вас могут заинтересовать'),
          SizedBox(
            height: 170 ,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 5; i++) const PlaceCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}