import 'package:flutter/material.dart';
import 'package:qaida/components/settings/account_settings.dart';
import 'package:qaida/components/settings/app_settings.dart';
import 'package:qaida/components/settings/settings_template.dart';
import 'package:qaida/components/settings/user_data.dart';
import 'package:qaida/components/settings/username.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {

    return const SettingsTemplate(
      children: [
        Username(),
        Text('Данные пользователя'),
        UserData(),
        Text('Приложение'),
        AppSettings(),
        Text('Аккаунт'),
        AccountSettings(),
      ],
    );
  }
}