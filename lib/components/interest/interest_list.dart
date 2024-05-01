import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/interest/interest_item.dart';
import 'package:qaida/providers/interests.provider.dart';

class InterestList extends StatelessWidget {
  const InterestList({super.key});

  @override
  Widget build(BuildContext context) {
    final interestProvider = context.watch<InterestsProvider>();
    return Expanded(
      child: ListView.builder(
        itemCount: interestProvider.interests.length,
        itemBuilder: (context, index) {
          return InterestItem(index: index);
        },
      ),
    );
  }
}