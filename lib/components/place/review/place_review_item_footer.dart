import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/place.provider.dart';

class PlaceReviewItemFooter extends StatelessWidget {
  final List votes;
  final String id;

  const PlaceReviewItemFooter({
    super.key,
    required this.votes,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    int positiveCount =
        votes.where((vote) => vote['type'] == 'POSITIVE').length;
    int negativeCount =
        votes.where((vote) => vote['type'] == 'NEGATIVE').length;
    final placeProvider = context.read<PlaceProvider>();
    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await placeProvider.voteReview(id, 'POSITIVE');
                      positiveCount++;
                    },
                    icon: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.thumb_up_alt_rounded),
                        ),
                        Text(positiveCount.toString()),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await placeProvider.voteReview(id, 'NEGATIVE');
                      negativeCount++;
                    },
                    icon: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(Icons.thumb_down_alt_rounded),
                        ),
                        Text(negativeCount.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Все отзывы'),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
