import 'package:flutter/material.dart';
import 'package:masumbook/account/login.dart';

import 'createaccount.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key});

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: const Image(image: AssetImage("assets/images/main1.png")),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(500)),
                color: Color.fromRGBO(250, 198, 61, 1),
              ),
              padding: const EdgeInsets.only(top: 60),
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,
                    child: Column(
                      children: [
                        const Text("Journey Through the Pages:",
                            style: TextStyle(
                              // color: Color.fromRGBO(213, 93, 13, 1),
                                fontFamily: "regular",
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 1)),
                        const Text("Exploring Your Favorite Book",
                            style: TextStyle(
                              // color: Color.fromRGBO(213, 93, 13, 1),
                                fontFamily: "regular",
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 1)),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Text(
                                "The title beckons readers to cherish a beloved book,embarking on a personal.",
                                textAlign: TextAlign.center))
                      ],
                    ),
                  ),
                  SizedBox(
                    // color: Colors.yellow,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                              },
                              splashColor: Colors.transparent,
                              child: Container(
                                alignment: Alignment.center,
                                height: 65,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromRGBO(213, 93, 13, 1),
                                  // color: Colors.black
                                ),
                                child: const Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 1)),
                              )
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                              },
                              splashColor: Colors.transparent,
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 65,
                                  decoration: const BoxDecoration(
                                    // color: Color.fromRGBO(31, 65, 187, 1),
                                  ),
                                  child: const Text("Register",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 1))
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
