import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_bottom_shape.dart';

class TheBottomSection extends StatefulWidget {
  const TheBottomSection({super.key});

  @override
  State<TheBottomSection> createState() => _TheBottomSectionState();
}

class _TheBottomSectionState extends State<TheBottomSection> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    var timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        counter++;
        setState(() {});
      },
    );
    if (counter == 6) {
      timer.cancel();
      //TODO : navigate to the next view
    }
  }

  @override
  Widget build(BuildContext context) {
    return counter == 2
        ? CustomBottomShape(height: 200.h)
        : CustomBottomShape(height: 400.h);
  }
}
