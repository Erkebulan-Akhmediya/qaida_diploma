import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/reviews/review_place_list_item.dart';
import 'package:qaida/providers/review.provider.dart';

class ReviewPlaceList extends StatelessWidget {
  const ReviewPlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewPlaceList = context.watch<ReviewProvider>().processing;
    return Expanded(
      child: ListView(
        children: [
          for (int i = 0; i < reviewPlaceList.length; i++)
            ReviewPlaceListItem(index: i),
        ],
      ),
    );
  }
}
