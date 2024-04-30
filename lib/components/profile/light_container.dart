import 'package:flutter/material.dart';
import 'package:qaida/components/profile/forward_button.dart';

class LightContainer extends StatelessWidget {
  final List<ForwardButton> children;
  final bool bottomMargin;

  const LightContainer({
    super.key,
    required this.children,
    this.bottomMargin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: (bottomMargin ? 20 : 0),
      ),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          for (int i = 0; i < children.length; i++)
            ...[
              children[i],
              if (i != children.length-1)
                const Divider(height: 0, color: Colors.blue,),
            ]
        ],
      ),
    );
  }
}