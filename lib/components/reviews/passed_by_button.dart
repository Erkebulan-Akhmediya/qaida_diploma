import 'package:flutter/material.dart';

class PassedByButton extends StatelessWidget {
  const PassedByButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Color(0xFFFF993A),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: const RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Проходил мимо',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}