import 'dart:async';
import 'dart:developer';

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
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        counter++;
        //TODO :counter == 3 => show the text
        if (counter == 4) {
          timer.cancel();
          //TODO : navigate to the next view
        }
        setState(() {});
        log("Counter is $counter");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return counter == 1
        ? CustomBottomShape(height: 200.h)
        : CustomBottomShape(height: 400.h);
  }
}
