import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:open_ai_app/core/utils/app_colors.dart';

class CustomBottomShape extends StatelessWidget {
  const CustomBottomShape({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      delay: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        height: min(350, height),
        width: double.infinity,
        child: CustomPaint(
          painter: RPSCustomPainter(),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = AppColors.mainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0003333, size.height * 0.2125714);
    path_0.quadraticBezierTo(size.width * 0.2510000, size.height * -0.0018571,
        size.width * 0.5016667, size.height * 0.0028571);
    path_0.quadraticBezierTo(size.width * 0.7519167, size.height * 0.0011429,
        size.width * 1.0040000, size.height * 0.2222857);
    path_0.lineTo(size.width * 1.0016667, size.height * 1.0014286);
    path_0.lineTo(size.width * 0.5016667, size.height * 1.0028571);
    path_0.lineTo(0, size.height * 1.0028571);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
