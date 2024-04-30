import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/interest_item.dart';
import 'package:qaida/providers/interests.provider.dart';
import 'package:qaida/providers/template.provider.dart';

class Interests extends StatelessWidget {
  const Interests({super.key});

  Future<void> handleSend(BuildContext context) async {
    List<String> interests = context.read<InterestsProvider>()
        .getSelectedIds();

    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'access_token');

    await context.read<InterestsProvider>()
        .sendInterests(token!, interests);
  }

  void navToHome(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    context.read<TemplateProvider>().changeTemplatePage(0);
  }

  @override
  Widget build(BuildContext context) {
    final interestProvider = context.watch<InterestsProvider>();
    return Container(
      decoration: BoxDecoration(
        color: Color(int.parse('4DD3D3D3', radix: 16)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(
                top: 40.0,
                left: 20.0,
                right: 20.0,
              ),
              children: <Widget>[
                const Text(
                  'Выберите интересы',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                ),
                const Text(
                  'Это поможет нам составлять более точные рекомендации для посещения',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                for (var i = 0; i < interestProvider.interests.length; i++)
                  InterestItem(index: i),
              ],
            ),
          ),
          Row(
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
          ),
        ],
      ),
    );
  }
}