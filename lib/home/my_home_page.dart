import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:webapp/responsive/responsive_layout.dart';
import 'package:webapp/home/top_nav_bar.dart';

import '../responsive/desktop_layout.dart';
import '../responsive/mobile_layout.dart';

class MyHomePage extends StatelessWidget {
  //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      //key: scaffoldKey,
      appBar: TopBar(),
      endDrawer: ResponsiveLayout.isMobileLayout(context) ? Drawer() : null,
      body: ResponsiveLayout(
        mobileLayout: MobileLayout(
          child: TabBarView(
            controller: tabPage.controller,
            children: [
              for (final stack in tabPage.stacks)
                PageStackNavigator(stack: stack)
            ],
          ),
        ),
        desktopLayout: DesktopLayout(
          child: TabBarView(
            controller: tabPage.controller,
            children: [
              for (final stack in tabPage.stacks)
                PageStackNavigator(stack: stack)
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
