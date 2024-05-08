import 'package:flutter/material.dart';
import 'package:qaida/components/reviews/review_place_list_item.dart';

class ReviewPlaceList extends StatelessWidget {
  const ReviewPlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          ReviewPlaceListItem(),
          ReviewPlaceListItem(),
        ],
      ),
    );
  }
}
