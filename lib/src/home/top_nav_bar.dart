import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../responsive/responsive_layout.dart';
import '../routing/routes.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    return AppBar(
        flexibleSpace: tabPage.index == 0
            ? Image.asset('assets/1.jpg', fit: BoxFit.fitWidth)
            : null,
        actions: ResponsiveLayout.isMobileLayout(context) ? [] : [
          SizedBox(
            width: 600,
            child: TabBar(
              controller: tabPage.controller,
              //flexibleSpace: Image.asset('assets/1.jpg', fit: BoxFit.cover,),
              tabs: ResponsiveLayout.isMobileLayout(context)
                  ? []
                  : [
                      ...navMenu.map((e) => Tab(
                            child: Text(e),
                          ))
                    ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () => Routemaster.of(context).push("/login"),
                child: const Text('Login')),
          )
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(300);
}
