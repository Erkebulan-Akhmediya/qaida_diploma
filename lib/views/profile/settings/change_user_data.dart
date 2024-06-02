import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/full_width_button.dart';
import 'package:qaida/providers/user.provider.dart';

class ChangeUserData extends StatelessWidget {
  final String? field;
  final Map fields = {
    'email': 'Почта',
    'messengerOne': 'Социальная сеть, чтобы переписываться',
    'messengerTwo': 'Социальная сеть, где публикую медиа-контент',
    'gender': 'Пол',
  };
  final TextEditingController controller = TextEditingController();

  ChangeUserData({super.key, this.field});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().myself;
    controller.text = field == null ? '' : user.toMap()[field!] ?? '';
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: field == null ? '' : fields[field],
              border: const OutlineInputBorder(),
            ),
          ),
          FullWidthButton(
            margin: const EdgeInsets.only(top: 15.0),
            text: 'Сохранить',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
