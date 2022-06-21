import 'package:flutter/material.dart';
import 'package:webapp/responsive/desktop_layout.dart';
import 'package:webapp/responsive/mobile_layout.dart';
import 'package:webapp/responsive/responsive_layout.dart';
import 'package:webapp/top_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      appBar: TopBar(),
      endDrawer: ResponsiveLayout.isMobileLayout(context) ? Drawer() : null,
      body: ResponsiveLayout(mobileLayout: MobileLayout(), desktopLayout: DesktopLayout(sideBar: Container(),)) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
