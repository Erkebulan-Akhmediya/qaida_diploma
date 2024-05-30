import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/place/review/place_review_item.dart';
import 'package:qaida/components/q_text.dart';
import 'package:qaida/providers/place.provider.dart';
import 'package:qaida/providers/theme.provider.dart';

class PlaceReviews extends StatelessWidget {
  const PlaceReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const QText(text: 'Оценки и отзывы'),
        Container(
          height: 200,
          color: context.watch<ThemeProvider>().lightWhite,
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<List>(
            future: context.read<PlaceProvider>().getPlaceReview(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final reviews = snapshot.data!;
                return PlaceReviewItem(review: reviews[0]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}