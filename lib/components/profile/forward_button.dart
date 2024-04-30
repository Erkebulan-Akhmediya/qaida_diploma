import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {
  final String text;
  final Widget? page;

  const ForwardButton({
    super.key,
    required this.text,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (page == null) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page!,
          ),
        );
      },
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