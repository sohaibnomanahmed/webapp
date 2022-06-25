import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:webapp/home/about_page.dart';
import 'package:webapp/authentication/login_page.dart';
import 'package:webapp/home/courses_page.dart';
import 'package:webapp/home/home_page.dart';
import 'package:webapp/routing/routes.dart';

import 'home/my_home_page.dart';

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
      routerDelegate: Routes.delegate,
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
