import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masumbook/account/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'createaccountFireBase.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var ee;
  var pp;

  Future getData() async{
    var shared = await SharedPreferences.getInstance();
    ee = shared.getString("email");
    pp = shared.getString("pass");
    print(ee);
    print(pp);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
            borderRadius: BorderRadius.only(topRight: Radius.circular(300))
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
                      "Create Account",
                      style: TextStyle(
                        fontFamily: "regular",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: const Text(
                          "Create an account so you can explore all the existing books",
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "regular"),
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
                  //input field conform password
                  //sign up btn
                  InkWell(
                      onTap: () async{
                        var shared = await SharedPreferences.getInstance();
                        shared.setString("email", email.text);
                        shared.setString("pass", pass.text);
                        SignUp(context, email.text, pass.text);
                      },
                      splashColor: Colors.transparent,
                      child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.08,
                          margin: const EdgeInsets.only(left: 25, right: 25),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(213, 93, 13, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text("Sign up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: 1)))),
                  const SizedBox(height: 30),
                  //already have account
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                    },
                    splashColor: Colors.transparent,
                    child: const Text(
                      "Already have an account",
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
