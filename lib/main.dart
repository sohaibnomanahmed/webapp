import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'src/app.dart';
import 'src/routing/routes.dart';
import 'src/theme/theming.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.authStateChanges().isEmpty;

  // services

  // infrastructure
  final routes = Routes();
  final theming = Theming();

  runApp(MyApp(
    routes: routes,
    theming: theming,
  ));
}
