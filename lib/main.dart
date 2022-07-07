import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:webapp/routing/routes.dart';
import 'package:webapp/theme/theming.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
