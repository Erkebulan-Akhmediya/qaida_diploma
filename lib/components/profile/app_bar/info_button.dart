import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final int count;

  const InfoButton({
    super.key,
    required this.icon,
    required this.text,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFFF2F3F6),
        margin: const EdgeInsets.all(10.0),
        child: TextButton(
          onPressed: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              Text(text),
              Text(
                '$count места',
                style: const TextStyle(fontSize: 10,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}