import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/auth.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Имя пользователя',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Пароль',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Зарегистрироваться'),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthProvider>().changeAuthPage();
              },
              child: const Text('Есть аккаунт? Войди'),
            ),
          ],
        ),
      ),
    );
  }
}