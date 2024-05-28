import 'package:flutter/material.dart';

class PlaceReviewItem extends StatelessWidget {
  final Map review;

  const PlaceReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (int i = 0;
                i < int.parse(review['score']['\$numberDecimal']);
                i++)
              const Icon(Icons.star_rounded),
          ],
        ),
        Text(review['comment']),
      ],
    );
  }
}
