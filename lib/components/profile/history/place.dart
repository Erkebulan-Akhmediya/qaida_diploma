import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  const Place({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 170,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image:  const DecorationImage(
                image: AssetImage('assets/sample.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text('Хан шатыр'),
          const Text('Торгово-развлекательный центр', style: TextStyle(fontSize: 10),),
          const Text('Проспект Туран, 37', style: TextStyle(fontSize: 10),),
        ],
      ),
    );
  }
}