import 'package:flutter/material.dart';
import 'package:qaida/components/all_button.dart';
import 'package:qaida/components/place.dart';
import 'package:qaida/components/search.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Search(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Популярные места',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                AllButton(),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Place(),
                Place(),
                Place(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Торгово развлекательные центры',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                AllButton(),
              ],
            ),
          ),
          SizedBox(
            height: 350,
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              children: [
                for (int i = 0; i < 6; i++) const Place(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Торгово развлекательные центры',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                AllButton(),
              ],
            ),
          ),
          SizedBox(
            height: 350,
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              children: [
                for (int i = 0; i < 6; i++) const Place(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}