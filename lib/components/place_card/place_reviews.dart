import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/place_card/place_review_item.dart';
import 'package:qaida/providers/place.provider.dart';

class PlaceReviews extends StatelessWidget {
  const PlaceReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder<List>(
        future: context.read<PlaceProvider>().getPlaceReview(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final reviews = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(10.0),
              children: [
                for (var review in reviews)
                  PlaceReviewItem(review: review),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}