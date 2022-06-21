import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  final Widget sideBar;

  const DesktopLayout({Key? key, required this.sideBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sideBar,
        Container(
         color: Colors.green,
        ),
      ],
    );
  }
}