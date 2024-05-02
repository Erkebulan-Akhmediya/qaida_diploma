import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/settings/settings_icon.dart';
import 'package:qaida/providers/user.provider.dart';

class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().myself;
    return Container(
      color: const Color(0xFFFAFAFA),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const SettingsIcon(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ФИО',
                style: TextStyle(
                  color: Color(0xFF7D7D7D),
                ),
              ),
              Text(
                '${user.name} ${user.surname}',
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}