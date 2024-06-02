import 'package:flutter/material.dart';
import 'package:qaida/components/place/review/place_review_item_body.dart';
import 'package:qaida/components/place/review/place_review_item_footer.dart';
import 'package:qaida/components/place/review/place_review_item_header.dart';

class PlaceReviewItem extends StatelessWidget {
  final Map review;

  const PlaceReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          PlaceReviewItemHeader(
            score: int.parse(review['score']['\$numberDecimal']),
            date: review['created_at'],
          ),
          PlaceReviewItemBody(comment: review['comment']),
          PlaceReviewItemFooter(
            id: review['_id'],
            votes: review['votes'],
          ),
        ],
      ),
    );
  }
}
