import 'package:flutter/material.dart';

class PlaceDescription extends StatelessWidget {
  const PlaceDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Описание'),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFAFAFA),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim',
                  softWrap: true,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text('Показать полностью'),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
