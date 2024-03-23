import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:masumbook/account/loginFireBase.dart';
import 'package:masumbook/pages/homepage.dart';
import 'package:masumbook/pages/upload/uploadtextfield.dart';

class Weekly extends StatefulWidget {
  const Weekly({super.key});

  @override
  State<Weekly> createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {

  TextEditingController account = TextEditingController();


  final fireStore = FirebaseFirestore.instance.collection("news");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: SafeArea(
              child: Column(
                children: [
                  const Text("Subscribe Now",style: TextStyle(fontFamily: "regular",fontSize: 40,fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 30,
                  ),
                  uploadTextField(context, 0.06, 0.9, "Gmail Account", account),
                  const SizedBox(
                    height: 30,
                  ),
                  uploadBtn(context, "Subscribe", () {
                    if(account.text.isEmpty){
                      DialogBox(context, "Please enter gmail account");
                    }
                    else{
                      String id = account.text.toString();
                      fireStore.doc(id).set({"gmail" : account.text}).then((value) => DialogBox(context, "Thanks for subscribe"));
                    }
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  uploadBtn(context, "Cancel", () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
