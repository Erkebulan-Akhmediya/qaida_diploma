import 'package:flutter/material.dart';

class InterestText extends StatelessWidget {
  final String text;

  const InterestText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text),
          const Icon(Icons.check_circle_outline),
        ],
      ),
    );
  }
}