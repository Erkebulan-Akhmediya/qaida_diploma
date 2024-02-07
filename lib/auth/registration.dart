import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/full_width_button.dart';
import 'package:qaida/components/password.dart';
import 'package:qaida/providers/auth.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Введите данные',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Эл. почта',
              ),
            ),
            const Password(),
            Container(
              margin: const EdgeInsets.only(
                top: 15.0,
                bottom: 7.0,
              ),
              child: const Text(
                'Пароль должен содержать следущее',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Row(
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text('8 символов (не более 20)'),
              ],
            ),
            const Row(
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text('1 буква и 1 цифра'),
              ],
            ),
            const Row(
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text('1 спец. символ (например, #?!\$&@)'),
              ],
            ),
            FullWidthButton(
              text: 'Зарегистрироваться',
              margin: const EdgeInsets.only(top: 20.0),
              onPressed: () {},
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        context.read<AuthProvider>().changeAuthPage();
                      },
                      child: const Text('Уже есть аккаунт? Войти'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}