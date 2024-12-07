import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          SizedBox(height: 40),
          CustomDrawerHeader(),
        ],
      ),
    );
  }
}
