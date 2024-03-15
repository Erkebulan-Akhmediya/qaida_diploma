import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/interest_item.dart';
import 'package:qaida/providers/interests.dart';

class Interests extends StatelessWidget {
  const Interests({super.key});

  @override
  Widget build(BuildContext context) {
    final interestProvider = context.watch<InterestsProvider>();
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse('4DD3D3D3', radix: 16)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
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
                for (var i = 0; i < interestProvider.interests.length; i++)
                  InterestItem(index: i),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Пропустить'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Далее'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}