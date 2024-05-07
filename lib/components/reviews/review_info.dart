import 'package:flutter/material.dart';

class ReviewInfo extends StatelessWidget {
  const ReviewInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.2),
        BlendMode.darken,
      ),
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/reviews.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Отличная работа!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'Оставляя отзыв вы подтверждаете, что посещали данное место. Осталось оценить 5 мест!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            LinearProgressIndicator(
              value: 1 / 6,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.green),
              minHeight: 12.0,
              semanticsLabel: '1/6',
            ),
          ],
        ),
      ),
    );
  }
}
