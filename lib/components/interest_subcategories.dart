import 'package:flutter/material.dart';

class InterestSubcategories extends StatelessWidget {
  final bool selected;
  final String text;
  final List categories;

  const InterestSubcategories({
    super.key,
    required this.selected,
    required this.text,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 300,
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(selected ? Icons.check_circle : Icons.check_circle_outline),
              ),
            ],
          ),
          Row(
            children: <Column>[
              Column(
                children: <Widget>[
                  for (var i = 0; i < 4; i++)
                    SizedBox(
                      width: 120,
                      child: Text(categories[i]['name']),
                    ),
                ],
              ),
              Column(
                children: <Widget>[
                  for (var i = 4; i < categories.length; i++)
                    SizedBox(
                      width: 120,
                      child: Text(categories[i]['name']),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}