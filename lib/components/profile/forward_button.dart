import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  final String text;

  const ForwardButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}