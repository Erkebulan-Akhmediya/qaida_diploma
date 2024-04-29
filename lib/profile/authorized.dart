import 'package:flutter/material.dart';
import 'package:qaida/components/profile/app_bar/auth_profile_bar.dart';
import 'package:qaida/components/profile/history/history.dart';

class Authorized extends StatelessWidget {
  const Authorized({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF2F3F6),
      appBar: AuthProfileBar(),
      body: Column(
        children: [
          History(),
        ],
      ),
    );
  }
}