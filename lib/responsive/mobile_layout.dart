import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final Widget child;

  const MobileLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}