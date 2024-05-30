import 'package:flutter/material.dart';
import 'package:qaida/components/place/review/place_review_item_body.dart';
import 'package:qaida/components/place/review/place_review_item_header.dart';

class PlaceReviewItem extends StatelessWidget {
  final Map review;

  const PlaceReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          PlaceReviewItemHeader(
            score: int.parse(review['score']['\$numberDecimal']),
            date: review['created_at'],
          ),
          PlaceReviewItemBody(comment: review['comment']),
        ],
      ),
    );
  }
}
