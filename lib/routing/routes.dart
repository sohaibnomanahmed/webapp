import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../auth/auth_page.dart';
import '../auth/auth_provider.dart';
import '../home/about_page.dart';
import '../home/courses_page.dart';
import '../home/home_page.dart';
import '../home/my_home_page.dart';

const homePage = "Home";
const coursesPage = "Courses";
const testmonialPage = "Testmonial";
const aboutPage = "About";
const contactPage = "Contact";

List<String> navMenu = [
  homePage,
  coursesPage,
  testmonialPage,
  aboutPage,
  contactPage
];

class Routes {
  static final routemasterDelegate = RoutemasterDelegate(
    routesBuilder: (context) => RouteMap(
      routes: {
        '/': (route) => TabPage(child: MyHomePage(), paths: const [
              '/home',
              '/courses',
              '/testmonial',
              '/about',
              '/contact'
            ]),
            // TODO should give services to provider to make them testable and make providers outside widget tree
        '/login': (route) => MaterialPage(child: ChangeNotifierProvider(create: (_) => AuthProvider(), child: AuthPage())),
        '/home': (route) => MaterialPage(child: HomePage()),
        '/courses': (route) => MaterialPage(child: CoursesPage()),
        '/testmonial': (route) => MaterialPage(child: AboutPage()),
        '/about': (route) => MaterialPage(child: AboutPage()),
        '/contact': (route) => MaterialPage(child: AboutPage()),
      },
    ),
  );
}
