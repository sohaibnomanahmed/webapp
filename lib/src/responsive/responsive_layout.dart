import 'package:flutter/material.dart';

import 'constraints.dart';


class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget desktopLayout;
  final Widget? tabletLayout;

  const ResponsiveLayout(
      {Key? key,
      required this.mobileLayout,
      required this.desktopLayout,
      this.tabletLayout})
      : super(key: key);

  static bool isMobileLayout(BuildContext context) => MediaQuery.of(context).size.width < mobileScreenSize; 
  static bool isTabletLayout(BuildContext context) => MediaQuery.of(context).size.width < tabletScreenSize; 
  static bool isDesktopLayout(BuildContext context) => MediaQuery.of(context).size.width > tabletScreenSize;  

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          constraints.maxWidth < mobileScreenSize
              ? mobileLayout
              : constraints.maxWidth < tabletScreenSize
                  ? tabletLayout ?? desktopLayout
                  : desktopLayout
    );
  }
}
