import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:masumbook/pages/home.dart';
import 'package:masumbook/pages/profile.dart';
import 'package:masumbook/pages/save.dart';
import 'package:masumbook/pages/setting.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  final List<Widget> screens = [
    Home(),
    Save(),
    Profile(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(31, 65, 187, 1),
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color.fromRGBO(250, 198, 61, 1),
        // buttonBackgroundColor: Colors.,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          Icon(EvaIcons.home,color: Colors.white,),
          Icon(EvaIcons.bookmark,color: Colors.white,),
          Icon(EvaIcons.smilingFace,color: Colors.white,),
          Icon(EvaIcons.settings,color: Colors.white,),
        ],
      )
    );
  }
}
