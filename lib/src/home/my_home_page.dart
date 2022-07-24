import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../responsive/desktop_layout.dart';
import '../responsive/mobile_layout.dart';
import '../responsive/responsive_layout.dart';
import '../routing/routes.dart';
import 'top_nav_bar.dart';

class MyHomePage extends StatelessWidget {
  //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      //key: scaffoldKey,
      appBar: const TopBar(),
      endDrawer: ResponsiveLayout.isMobileLayout(context)
          ? Drawer(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // NOTE another option is to use NavigationRail
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: TabBar(
                        labelColor: Theme.of(context).primaryColor,
                        controller: tabPage.controller,
                        tabs: [
                          ...navMenu.map((e) => 
                            Tab(
                              height: double.infinity,
                                  child: RotatedBox(
                            quarterTurns: -1,
                            child: Text(e),
                                ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            )
          : null,
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
