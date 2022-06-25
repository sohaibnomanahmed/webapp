import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:webapp/about_page.dart';
import 'package:webapp/courses_page.dart';
import 'package:webapp/home_page.dart';

import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (context) => RouteMap(
          routes: {
            '/': (route) => TabPage(child: MyHomePage(), paths: const [
                  '/home',
                  '/courses',
                  '/testmonial',
                  '/about',
                  '/contact'
                ]),
            //'/login': (route) => MaterialPage(child: MyHomePage()),
            '/home': (route) => MaterialPage(child: HomePage()),
            '/courses': (route) => MaterialPage(child: CoursesPage()),
            '/testmonial': (route) => MaterialPage(child: AboutPage()),
            '/about': (route) => MaterialPage(child: AboutPage()),
            '/contact': (route) => MaterialPage(child: AboutPage()),
          },
        ),
      ),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
