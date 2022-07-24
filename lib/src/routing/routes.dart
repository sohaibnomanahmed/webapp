import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../auth/auth_page.dart';
import '../auth/auth_provider.dart';
import '../auth/auth_service.dart';
import '../courses/dashboard_page.dart';
import '../home/about_page.dart';
import '../home/courses_page.dart';
import '../home/home_page.dart';
import '../home/my_home_page.dart';
import '../user/user_service.dart';

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
  final loggedInMap = RouteMap(
      onUnknownRoute: (_) => const Redirect('/'),
      routes: {'/': (route) => const MaterialPage(child: DashBoardPage())});

  final loggedOutMap = RouteMap(
    onUnknownRoute: (_) => const Redirect('/'),
    routes: {
      '/': (route) => TabPage(child: MyHomePage(), paths: const [
            '/home',
            '/courses',
            '/testmonial',
            '/about',
            '/contact'
          ]),
      '/login': (route) => MaterialPage(
          child: ChangeNotifierProvider(
              create: (_) => AuthProvider(
                    authService: AuthService(),
                    userService: UserService(),
                  ),
              child: const AuthPage())),
      '/home': (route) => const MaterialPage(child: HomePage()),
      '/courses': (route) => const MaterialPage(child: CoursesPage()),
      '/testmonial': (route) => const MaterialPage(child: AboutPage()),
      '/about': (route) => const MaterialPage(child: AboutPage()),
      '/contact': (route) => const MaterialPage(child: AboutPage()),
    },
  );

  final RoutemasterParser routemasterParser = const RoutemasterParser();
  late RoutemasterDelegate routemasterDelegate;

  Routes() {
    routemasterDelegate = RoutemasterDelegate(routesBuilder: (context) {
      final user = Provider.of<User?>(context);
      final bool loggedIn = user != null;
      return loggedIn ? loggedInMap : loggedOutMap;
    });
  }
}
