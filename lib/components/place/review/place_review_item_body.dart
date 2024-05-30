import 'package:flutter/material.dart';

class PlaceReviewItemBody extends StatelessWidget {
  final String comment;

  const PlaceReviewItemBody({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.comment_rounded),
        Flexible(
          child: Text(
            comment,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
