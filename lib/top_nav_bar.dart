import 'package:flutter/material.dart';
import 'package:webapp/routing/routes.dart';

import 'responsive/responsive_layout.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Image.asset('assets/1.jpg', fit: BoxFit.cover,),
      actions: ResponsiveLayout.isMobileLayout(context)
          ? null
          : [
              ...navMenu
                  .map((e) => ElevatedButton(onPressed: () {}, child: Text(e)))
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(300);
}
