import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  final Widget child;
  final Widget? sidebar;

  const DesktopLayout({Key? key, required this.child, this.sidebar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return sidebar != null ? Row(
      children: [
        Flexible(child: sidebar!),
        Flexible(flex: 5, child: child)
      ],
    )
    : child;
  }
}
