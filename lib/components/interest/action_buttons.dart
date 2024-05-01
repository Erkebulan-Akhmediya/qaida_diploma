import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/interests.provider.dart';
import 'package:qaida/providers/template.provider.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  Future<void> handleSend(BuildContext context) async {
    List<String> interests = context.read<InterestsProvider>().getSelectedIds();

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'access_token');

    await context.read<InterestsProvider>().sendInterests(token!, interests);
  }

  void navToHome(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    context.read<TemplateProvider>().changeTemplatePage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              navToHome(context);
            },
            child: const Text('Пропустить'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              await handleSend(context);
              navToHome(context);
            },
            child: const Text('Далее'),
          ),
        ),
      ],
    );
  }
}