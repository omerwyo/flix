// import 'package:flix/responsive.dart';
import 'package:flix/screens/dashboard/components/header.dart';
// import 'package:flix/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
// import 'components/header.dart';
// import 'components/recent_files.dart';
// import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: const [
            Header(),
          ],
        ),
      ),
    );
  }
}
