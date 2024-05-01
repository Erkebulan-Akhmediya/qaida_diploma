import 'package:flutter/material.dart';
import 'package:qaida/components/profile/app_bar/auth_profile_bar.dart';
import 'package:qaida/components/profile/forward_button.dart';
import 'package:qaida/components/profile/history/history.dart';
import 'package:qaida/components/profile/light_container.dart';
import 'package:qaida/views/profile/settings.dart';

class Authorized extends StatelessWidget {
  const Authorized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F6),
      appBar: const AuthProfileBar(),
      body: ListView(
        children: const [
          History(),
          LightContainer(
            children: [
              ForwardButton(text: 'Сохраненные',),
              ForwardButton(text: 'Посещенные места',),
              ForwardButton(text: 'Оставленные отзывы',),
            ],
          ),
          LightContainer(
            bottomMargin: true,
            children: [
              ForwardButton(text: 'Настройки', page: Settings(),),
              ForwardButton(text: 'О нас',),
              ForwardButton(text: 'Помощь',),
            ],
          ),
        ],
      ),
    );
  }
}