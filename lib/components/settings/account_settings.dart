import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/forward_button.dart';
import 'package:qaida/components/light_container.dart';
import 'package:qaida/providers/auth.provider.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return LightContainer(
      children: [
        ForwardButton(
          leading: const Icon(
            Icons.exit_to_app,
            color: Color(0xFF1E3050),
          ),
          text: 'Выйти из аккаунта',
          icon: false,
          onPressed: () {
            const storage = FlutterSecureStorage();
            storage.deleteAll();
            context.read<AuthProvider>().changeAuthStatus();
            Navigator.pop(context);
          },
        ),
        const ForwardButton(
          leading: Icon(
            Icons.restore_from_trash,
            color: Color(0xFF1E3050),
          ),
          text: 'Деактивировать/удалить аккаунт',
          icon: false,
        ),
      ],
    );
  }
}