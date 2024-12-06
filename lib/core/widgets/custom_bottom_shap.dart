import 'dart:math';

import 'package:flutter/material.dart';

import 'rps_custom_painter.dart';

class CustomBottomShape extends StatelessWidget {
  const CustomBottomShape({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      height: min(height, MediaQuery.sizeOf(context).height * .35),
      width: double.infinity,
      child: CustomPaint(
        painter: RPSCustomPainter(),
      ),
    );
  }
}
