import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/auth/interests.dart';
import 'package:qaida/auth/validators.dart';
import 'package:qaida/components/full_width_button.dart';
import 'package:qaida/components/password.dart';
import 'package:qaida/providers/auth.dart';
import 'package:qaida/providers/interests.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
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
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Эл. почта',
                ),
              ),
              Password(
                controller: authProvider.registrationPasswordController,
                onChanged: (password) {
                  context.read<AuthProvider>().changeValidationState();
                },
              ),
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
              const Validators(),
              FullWidthButton(
                text: 'Зарегистрироваться',
                margin: const EdgeInsets.only(top: 20.0),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Interests(),
                    ),
                  );
                },
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
      ),
    );
  }
}