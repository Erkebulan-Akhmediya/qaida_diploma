import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/all_button.dart';
import 'package:qaida/components/categories/category_preview.dart';
import 'package:qaida/components/place.dart';
import 'package:qaida/components/search.dart';
import 'package:qaida/providers/category.provider.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<CategoryProvider>().categories;
    return FutureBuilder(
      future: context.read<CategoryProvider>().getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else {
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
                for (int i = 0; i < categories.length; i++)
                  CategoryPreview(index: i,),
              ],
            ),
          );
        }
      },
    );
  }
}
