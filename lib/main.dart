import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:webapp/routing/routes.dart';
import 'package:webapp/theme/theming.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: Theming.lightTheme,
      routerDelegate: Routes.routemasterDelegate,
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
