import 'package:flutter/material.dart';

class PlaceReviewItemHeader extends StatelessWidget {
  final int score;
  final String date;

  const PlaceReviewItemHeader({
    super.key,
    required this.score,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.person),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (int i = 0; i < score; i++) const Icon(Icons.star_rounded),
              ],
            ),
            Text(date.substring(0, 10)),
          ],
        ),
      ],
    );
  }
}
