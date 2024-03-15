import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/interests.dart';

class InterestSubcategories extends StatelessWidget {
  final int index;

  const InterestSubcategories({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final interestProvider = context.watch<InterestsProvider>();
    return Container(
      width: 270,
      height: 300,
      decoration: BoxDecoration(
        color: interestProvider.selectedItems[index] ?
          Colors.white : Colors.transparent,
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
                interestProvider.interests[index]['name'],
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  interestProvider.selectedItems[index] ?
                  Icons.check_circle : Icons.check_circle_outline
                ),
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
                      child: Text(interestProvider.subcategories(index)[i]['name']),
                    ),
                ],
              ),
              Column(
                children: <Widget>[
                  for (var i = 4; i < interestProvider.subcategories(index).length; i++)
                    SizedBox(
                      width: 120,
                      child: Text(interestProvider.subcategories(index)[i]['name']),
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