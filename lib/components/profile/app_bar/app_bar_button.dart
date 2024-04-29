import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Row(
        children: [
          Text('Имя Фамилия'),
          Icon(Icons.arrow_forward_ios, color: Colors.blue,),
        ],
      ),
    );
  }
}