import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/registration_footer.dart';
import 'package:qaida/interests/loader.dart';
import 'package:qaida/auth/validators.dart';
import 'package:qaida/components/full_width_button.dart';
import 'package:qaida/components/password.dart';
import 'package:qaida/providers/auth.dart';
import 'package:qaida/providers/login.dart';
import 'package:qaida/providers/registration.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  void navToInterest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Loader(),
      ),
    );
  }

  void showRegistrationError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ошибка регистрации'),
      ),
    );
  }

  Future<void> handleRegistration(
    BuildContext context,
    String email,
    String password
  ) async {

    try {
      await context.read<AuthProvider>().register(email, password);
    } catch(e) {
      showRegistrationError(context);
    }

    try {
      final response = await context.read<LoginProvider>().login(email, password);

      const storage = FlutterSecureStorage();
      await storage.write(
        key: 'access_token',
        value: response['access_token']
      );
      await storage.write(
        key: 'refresh_token',
        value: response['refresh_token']
      );
      navToInterest(context);
    } catch(e) {
      context.read<AuthProvider>().changeAuthPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final registrationProvider = context.watch<RegistrationProvider>();
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
                controller: registrationProvider.emailController,
                decoration: const InputDecoration(
                  labelText: 'Эл. почта',
                ),
              ),
              Password(
                controller: registrationProvider.passwordController,
                onChanged: (password) {
                  context.read<AuthProvider>().changeValidationState(password);
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
                  await handleRegistration(
                    context,
                    registrationProvider.emailController.text,
                    registrationProvider.passwordController.text
                  );
                  registrationProvider.emailController.text = '';
                  registrationProvider.passwordController.text = '';
                },
              ),
              const Expanded(
                child: RegistrationFooter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}