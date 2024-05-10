import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qaida/components/reviews/passed_by_button.dart';

class ReviewPlaceListItem extends StatelessWidget {
  const ReviewPlaceListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset('assets/sample.jpg', width: 100),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Хан Шатыр'),
                    const Text('Проспект Туран, 37'),
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
