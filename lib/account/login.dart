import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masumbook/account/createaccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'createaccountFireBase.dart';
import 'loginFireBase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(250, 198, 61, 1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(300))
          ),
          child: Column(
            children: [
              //Text
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                // color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login here",
                      style: TextStyle(
                        fontFamily: "regular",
                        // color: Color.fromRGBO(213, 93, 13, 1),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: const Text(
                          "Welcome back you’ve been missed!",
                          style: TextStyle(
                              fontFamily: "regular",
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
              ),
              Column(
                children: [
                  //input field email
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                          contentPadding:
                          EdgeInsets.only(left: 15, top: 20, bottom: 20),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(31, 65, 187, 1),
                              ))),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //input field password
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      controller: pass,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          contentPadding:
                          EdgeInsets.only(left: 15, top: 20, bottom: 20),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(31, 65, 187, 1),
                              ))),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //forgot password
                  Container(
                    // color: Colors.pink,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    child: InkWell(
                        onTap: () {},
                        splashColor: Colors.transparent,
                        child: const Text(
                          "Forgot your password?",
                          style: TextStyle(
                              color: Color.fromRGBO(213, 93, 13, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          textAlign: TextAlign.right,
                        )),
                  ),
                  const SizedBox(height: 30),
                  //sign in btn
                  InkWell(
                      onTap: () async{
                        var shared = await SharedPreferences.getInstance();
                        shared.setString("email", email.text);
                        shared.setString("pass", pass.text);
                        logIn(context, email.text, pass.text);
                      },
                      splashColor: Colors.transparent,
                      child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.08,
                          margin: const EdgeInsets.only(left: 25, right: 25),
                          decoration: BoxDecoration(
                            // color: const Color.fromRGBO(31, 65, 187, 1),
                              color: const Color.fromRGBO(213, 93, 13, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("Sign in",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: 1)))),
                  const SizedBox(height: 30),
                  //create new account
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const RegisterPage()));
                    },
                    splashColor: Colors.transparent,
                    child: const Text(
                      "Create new account",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //another option
                  Column(
                    children: [
                      const Text(
                        "Or continue with",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(213, 93, 13, 1),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              var userGoogle = await signWithGoogle(context);
                              var temp2 = userGoogle.email;
                              var shared = await SharedPreferences.getInstance();
                              await shared.setString("gmail", temp2);
                            },
                            splashColor: Colors.transparent,
                            child: Container(
                                height: 45,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[200]),
                                child: const Icon(FontAwesomeIcons.google)),
                          ),
                          const SizedBox(width: 5,),
                          InkWell(
                            onTap: (){
                              FaceBook(context);
                            },
                            splashColor: Colors.transparent,
                            child: Container(
                                height: 45,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[200]),
                                child: const Icon(FontAwesomeIcons.facebook)),
                          ),
                          const SizedBox(width: 5,),
                          InkWell(
                            onTap: (){},
                            splashColor: Colors.transparent,
                            child: Container(
                                height: 45,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[200]),
                                child: const Icon(FontAwesomeIcons.apple)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
