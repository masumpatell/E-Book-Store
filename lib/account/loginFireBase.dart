import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../pages/homepage.dart';

// ========================================================================================
// DAILOGBOX
DialogBox(BuildContext context,String text){
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(text,style: const TextStyle(fontFamily: "regular")),
        backgroundColor: Color.fromRGBO(245, 235, 208, 1),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("okay",style: TextStyle(fontFamily: "regular")))
        ],
      ));
}

// ==========================================================================================================
//Login

//UserCredential
//UserCredential ee firebase no class che
//UserCredential is a class used in Firebase Authentication to represent the result of a user signing in or signing up. It contains information about the user and the authentication process. When a user successfully signs in or signs up using Firebase Authentication methods, such as signInWithEmailAndPassword, signInWithGoogle, createUserWithEmailAndPassword, etc.,

//createUserWithEmailAndPassword
//weak-password, operation-not-allowed(wrong account), invalid-email, email-already-in-use,

//FirebaseAuth
//Firebase ma store karshee

logIn(BuildContext context, String email, String pass) async {
  if (email.isEmpty || pass.isEmpty) {
    DialogBox(context, "Please Enter Email or Password");
  }
  else{
    UserCredential? user;
    try{
      user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
    }
    on FirebaseAuthException catch(e){
        if( e.code == "invalid-email"){
          DialogBox(context, "Enter Valid EmailId");
        }
        else if( e.code == "invalid-credential"){
          DialogBox(context, "Enter Valid Email or Password");
        }
        else{
          DialogBox(context, e.toString());
        }
    }
  }
}

