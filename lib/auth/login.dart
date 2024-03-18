import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/full_width_button.dart';
import 'package:qaida/components/password.dart';
import 'package:qaida/providers/auth.dart';
import 'package:qaida/providers/login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final loginProvider = context.watch<LoginProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: authProvider.loginFormKey,
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
                controller: loginProvider.emailController,
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Такого пользователя не существует';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Эл. почта',
                ),
              ),
              Password(
                controller: loginProvider.passwordController,
              ),
              FullWidthButton(
                text: 'Войти',
                margin: const EdgeInsets.only(top: 20.0),
                onPressed: () async {
                  if (
                    !authProvider.loginFormKey.currentState!.validate()
                  ) return;
                  final tokens = await context.read<LoginProvider>().login(
                    loginProvider.emailController.text,
                    loginProvider.passwordController.text,
                  );
                  if (tokens == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Не удалось войти'),
                      ),
                    );
                    return;
                  }
                  authProvider.changeAuthStatus();
                  Navigator.pop(context);
                },
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
      ),
    );
  }
}