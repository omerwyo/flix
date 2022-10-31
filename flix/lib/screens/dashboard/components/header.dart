import 'package:flix/controllers/MenuController.dart';
import 'package:flix/responsive.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

// import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Flix Dashboard",
            style: Theme.of(context).textTheme.headline5,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // Expanded(child: SearchField()),
        // ProfileCard()
      ],
    );
  }
}
