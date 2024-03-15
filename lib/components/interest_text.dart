import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/interests.dart';

class InterestText extends StatelessWidget {
  final int index;

  const InterestText({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final interestProvider = context.watch<InterestsProvider>();
    return Container(
      width: 270,
      height: 50,
      decoration: BoxDecoration(
        color: interestProvider.selectedItems[index] ? Colors.white : Colors.transparent,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            interestProvider.interests[index]['name'],
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(interestProvider.selectedItems[index] ? Icons.check_circle : Icons.check_circle_outline),
          ),
        ],
      ),
    );
  }
}