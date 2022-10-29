// import 'package:flix/responsive.dart';
import 'package:flix/screens/dashboard/dashboard_screen.dart';
import 'package:flix/screens/main/components/side_menu.dart';
// import 'package:flix/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';

// import '../../constants.dart';
// import 'components/header.dart';

// import 'components/recent_files.dart';
// import 'components/storage_details.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
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
    // return SafeArea(
    //   child: SingleChildScrollView(
    //     primary: false,
    //     padding: EdgeInsets.all(defaultPadding),
    //     child: Column(
    //       children: [
    //         Header(),
    //         SizedBox(height: defaultPadding),
    //         Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Expanded(
    //               flex: 5,
    //               child: Column(
    //                 children: [
    //                   MyFiles(),
    //                   SizedBox(height: defaultPadding),
    //                   RecentFiles(),
    //                   if (Responsive.isMobile(context))
    //                     SizedBox(height: defaultPadding),
    //                   if (Responsive.isMobile(context)) StarageDetails(),
    //                 ],
    //               ),
    //             ),
    //             if (!Responsive.isMobile(context))
    //               SizedBox(width: defaultPadding),
    //             // On Mobile means if the screen is less than 850 we dont want to show it
    //             if (!Responsive.isMobile(context))
    //               Expanded(
    //                 flex: 2,
    //                 child: StarageDetails(),
    //               ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
