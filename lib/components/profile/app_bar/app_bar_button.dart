import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/user.provider.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().myself;
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Text('${user.name} ${user.surname}'),
          const Icon(Icons.arrow_forward_ios, color: Colors.blue,),
        ],
      ),
    );
  }
}