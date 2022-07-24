import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/theming.dart';
import 'routing/routes.dart';

class MyApp extends StatelessWidget {
  final Routes routes;
  final Theming theming;

  const MyApp({
    Key? key,
    required this.routes,
    required this.theming,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
            create: (_) => FirebaseAuth.instance.authStateChanges(),
            initialData: null)
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: theming.lightTheme,
        routerDelegate: routes.routemasterDelegate,
        routeInformationParser: routes.routemasterParser,
      ),
    );
  }
}
