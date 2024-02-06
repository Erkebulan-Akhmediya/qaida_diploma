import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;
  final EdgeInsets? margin;

  const FullWidthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.margin = const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: 40.0,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}