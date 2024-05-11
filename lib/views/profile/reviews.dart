import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/reviews/my_reviews.dart';
import 'package:qaida/components/reviews/pending_review.dart';
import 'package:qaida/providers/review.provider.dart';

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ReviewProvider>().getProcessingPlaces(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: const Color(0xFFF2F3F6),
              appBar: AppBar(
                backgroundColor: const Color(0xFFF2F3F6),
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF1E3050),
                  ),
                ),
                title: const Text(
                  'Мои отзывы',
                  style: TextStyle(
                    color: Color(0xFF1E3050),
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Ожидают отзыва',
                        style: TextStyle(color: Color(0xFF1E3050)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Мои отызывы',
                        style: TextStyle(color: Color(0xFF1E3050)),
                      ),
                    ),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  PendingReview(),
                  MyReviews(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
