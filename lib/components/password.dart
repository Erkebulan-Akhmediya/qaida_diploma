import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/auth.dart';

class Password extends StatelessWidget {
  final TextEditingController? controller;

  const Password({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return TextField(
      controller: controller,
      obscureText: authProvider.isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Пароль',
        suffixIcon: IconButton(
          onPressed: () {
            context.read<AuthProvider>().changePasswordVisibility();
          },
          icon: Icon(
            authProvider.isPasswordVisible ?
            Icons.visibility_off_outlined :
            Icons.remove_red_eye_outlined,
          ),
        ),
      ),
    );
  }
}