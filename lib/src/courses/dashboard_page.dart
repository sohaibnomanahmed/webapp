import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webapp/src/responsive/desktop_layout.dart';
import 'package:webapp/src/responsive/responsive_layout.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveLayout(
            mobileLayout: Container(),
            desktopLayout: DesktopLayout(child: Container(child: Text("Helooo")), sidebar: Drawer(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          
                          Expanded(child: Container())    
                        ],
                      ),
                    ))
            ));
  }
}
