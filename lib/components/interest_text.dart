import 'package:flutter/material.dart';

class InterestText extends StatelessWidget {
  final String text;
  final bool selected;

  const InterestText({super.key, required this.text, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 50,
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(selected ? Icons.check_circle : Icons.check_circle_outline),
          ),
        ],
      ),
    );
  }
}