import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qaida/providers/interests.dart';

class InterestIcon extends StatelessWidget {
  final int index;

  const InterestIcon({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final interestProvider = context.watch<InterestsProvider>();
    return CustomPaint(
      painter: HexagonPainter(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: interestProvider.openItems[index] ?
          const Icon(
            Icons.keyboard_arrow_up,
            size: 50,
          ) :
          const Icon(
            Icons.menu,
            size: 50,
          ),
      ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 4)
      ..lineTo(size.width, size.height * 3 / 4)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height * 3 / 4)
      ..lineTo(0, size.height / 4)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}