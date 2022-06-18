import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  //final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    Key? key,
    required this.mobileLayout,
    required this.desktopLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) =>
          constraints.maxWidth < 700 ? mobileLayout : desktopLayout),
    );
  }
}
