import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/components/forward_button.dart';
import 'package:qaida/components/light_container.dart';
import 'package:qaida/providers/user.provider.dart';
import 'package:qaida/views/profile/settings/change_user_data.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().myself;
    return LightContainer(
      children: [
        ForwardButton(
          label: 'Почта',
          text: user.email,
          page: ChangeUserData(field: 'email'),
        ),
        ForwardButton(
          label: 'Социальная сеть, чтобы переписываться',
          text: user.messengerOne == null ? 'Не указан' : user.messengerOne!,
          page: ChangeUserData(field: 'messengerOne'),
        ),
        ForwardButton(
          label: 'Социальная сеть, где публикую медиа-контент',
          text: user.messengerTwo == null ? 'Не указан' : user.messengerTwo!,
          page: ChangeUserData(field: 'messengerTwo'),
        ),
        ForwardButton(
          label: 'Пол',
          text: user.gender == 'MALE'
              ? 'Мужской'
              : (user.gender == 'FEMALE' ? 'Женский' : 'Не указан'),
          page: ChangeUserData(field: 'gender'),
        ),
      ],
    );
  }
}
