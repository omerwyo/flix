// import 'package:flix/responsive.dart';
import 'package:flix/screens/dashboard/dashboard_screen.dart';
import 'package:flix/screens/main/components/side_menu.dart';
// import 'package:flix/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';

// import '../../constants.dart';
// import 'components/header.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SideMenu(),
          ),
          Expanded(
            flex: 5,
            child: DashboardScreen(),
          ),
        ],
      )),
    );
  }
}
