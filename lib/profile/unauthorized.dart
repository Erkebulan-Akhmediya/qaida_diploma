import 'package:flutter/material.dart';
import 'package:qaida/auth/auth.dart';

class Unauthorized extends StatelessWidget {
  const Unauthorized({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.person),
        const Text('Войти в существующий аккаунт'),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Auth(),
              ),
            );
          },
          child: const Text('Вход в аккаунт'),
        ),
      ],
    );
  }
}