import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../pages/homepage.dart';

// ========================================================================================
// DAILOGBOX
DialogBox(BuildContext context,String text){
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(text,style: const TextStyle(fontFamily: "regular")),
        backgroundColor: const Color.fromRGBO(245, 235, 208, 1),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("okay",style: TextStyle(fontFamily: "regular"),))
        ],
      ));
}

// ==========================================================================================================
//SIGNIN

//UserCredential
//UserCredential ee firebase no class che
//UserCredential is a class used in Firebase Authentication to represent the result of a user signing in or signing up. It contains information about the user and the authentication process. When a user successfully signs in or signs up using Firebase Authentication methods, such as signInWithEmailAndPassword, signInWithGoogle, createUserWithEmailAndPassword, etc.,

//createUserWithEmailAndPassword
//weak-password, operation-not-allowed(wrong account), invalid-email, email-already-in-use,

//FirebaseAuth
//Firebase ma store karshee

SignUp(BuildContext context, String email, String pass) async {
  if (email.isEmpty || pass.isEmpty) {
    DialogBox(context, "Please Enter Email or Password");
  } else {
    UserCredential? user;
    try{
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomePage())));
    }
    on FirebaseAuthException catch(e){
      if( e.code == "email-already-in-use"){
        DialogBox(context, "EmailId Already Exits");
      }
      else if( e.code == "invalid-email"){
        DialogBox(context, "Enter Valid Id");
      }
      else if(e.code == "weak-password"){
        DialogBox(context, "Password be at least 6 Characters");
      }
      else{
        DialogBox(context, e.toString());
      }
    }
  }
}


// ====================================================================================================================
// GOOGLE SIGNIN

//GoogleSignInAccount
//user no google account no data store kare variable ma, apde screen par photo, id, name, gmailId etc

//GoogleSignIn
//google sathe sign in karshe

//signIn()
//device ma jetla pan google account hashe e show karshe... ena par user click karshe tyare GoogleSignIn() call thashe

//GoogleSignInAuthentication
//have success signIn thai gayu... GoogleSignInAuthentication ee authentication details store karshe like access token and id token

//authentication
//ee userGoogle ne access token and id token provide karshe

//accessToken and idToken
//Firebase ma Authentication karva use thay chee..googleAuth ama user na token store thai gaya hata e token na help thi sign ni process agad vadharshe

//pachi signIn kari ne agad vadhi jashe


signWithGoogle(context) async {
  try{
    GoogleSignInAccount? userGoogle;
    userGoogle = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth;
    googleAuth = await userGoogle?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));

    return userGoogle;
  }
  on FirebaseAuthException catch(e){
    if(e.code == "account-exists-with-different-credential"){
        DialogBox(context, "Account Already Exit in Other Device");
    }
    else if(e.code == "operation-not-allowed"){
      DialogBox(context, "This Google Account Unavailable For This App");
    }
    else if(e.code == "user-not-found"){
      DialogBox(context, "User Not Found");
    }
    else{
      DialogBox(context, e.toString());
    }
  }
}

// ====================================================================================================================

//FaceBook
// ====================================================================================================================

Future FaceBook(context) async{
  try{
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
  }
  catch(e){
    if(e == "account-exists-with-different-credential"){
        DialogBox(context, "Account Already Exit in Other Device");
    }
    else if(e == "user-not-found"){
      DialogBox(context, "User Not Found");
    }
    else if(e == "operation-not-allowed"){
      DialogBox(context, "This Google Account Unavailable For This App");
    }
    else{
      DialogBox(context, e.toString());
      print(e.toString());
    }
  }
}