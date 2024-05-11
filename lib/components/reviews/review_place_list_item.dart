import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/reviews/passed_by_button.dart';
import 'package:qaida/providers/review.provider.dart';

class ReviewPlaceListItem extends StatelessWidget {
  final int index;

  const ReviewPlaceListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final reviewPlaceList = context.watch<ReviewProvider>().processing;
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.network(
                  reviewPlaceList[index]['image'],
                  width: 100,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(reviewPlaceList[index]['title']),
                    Text(reviewPlaceList[index]['address']),
                    RatingBar.builder(
                      itemBuilder: (BuildContext context, _) => const Icon(
                        Icons.star_rounded,
                        color: Colors.yellow,
                      ),
                      onRatingUpdate: (double value) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const PassedByButton(),
        ],
      ),
    );
  }
}
