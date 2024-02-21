import 'package:flutter/material.dart';
import 'package:qaida/components/interest_icon.dart';
import 'package:qaida/components/interest_text.dart';

class InterestItem extends StatelessWidget {
  final String text;

  const InterestItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const InterestIcon(),
        InterestText(text: text),
      ],
    );
  }
}