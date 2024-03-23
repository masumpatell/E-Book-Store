import 'package:flutter/material.dart';
import 'package:masumbook/account/option.dart';
import 'package:masumbook/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:masumbook/account/createaccount.dart';

import 'home.dart';
class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {

  var ee;
  var gg;

  getData() async{
    var shared = await SharedPreferences.getInstance();
    ee = shared.getString("email");
    gg = shared.getString("gmail");
    if((ee != null && ee.isNotEmpty) || (gg != null && gg.isNotEmpty)){
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      });
    }
    else{
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OptionPage(),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(250, 198, 61, 1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/intro.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
