import 'package:flutter/material.dart';
import 'package:qaida/components/profile/app_bar/auth_profile_bar.dart';
import 'package:qaida/components/forward_button.dart';
import 'package:qaida/components/profile/history/history.dart';
import 'package:qaida/components/light_container.dart';
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
            margin: EdgeInsets.only(top: 20, right: 20, left: 20,),
            children: [
              ForwardButton(text: 'Сохраненные',),
              ForwardButton(text: 'Посещенные места',),
              ForwardButton(text: 'Оставленные отзывы',),
            ],
          ),
          LightContainer(
            margin: EdgeInsets.all(20.0),
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