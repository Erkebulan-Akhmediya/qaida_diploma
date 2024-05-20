import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/q_icon.dart';
import 'package:qaida/components/q_text.dart';
import 'package:qaida/providers/user.provider.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key});

  String fullName(String? name, String? surname, String email) {
    List<String> splitEmail = email.split('@');
    if (name == null && surname == null) {
      return '${splitEmail[0]} ${splitEmail[1]}';
    }
    if (name == null) return surname!;
    if (surname == null) return name;
    return '$name $surname';
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().myself;
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          QText(text: fullName(user.name, user.surname, user.email)),
          const QIcon(icon: Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
