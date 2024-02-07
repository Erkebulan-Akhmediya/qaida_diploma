import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/full_width_button.dart';
import 'package:qaida/components/password.dart';
import 'package:qaida/providers/auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
            FullWidthButton(
              text: 'Войти',
              margin: const EdgeInsets.only(top: 20.0),
              onPressed: () {},
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        context.read<AuthProvider>().changeAuthPage();
                      },
                      child: const Text('Еще нет аккаунта? Регистрация'),
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