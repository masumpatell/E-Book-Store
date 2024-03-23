import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:masumbook/account/loginFireBase.dart';
import 'package:masumbook/pages/homepage.dart';
import 'package:masumbook/pages/upload/uploadtextfield.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController pages = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController account = TextEditingController();
  var pdf;

  final fireStore = FirebaseFirestore.instance.collection("books");

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.yellow,
          alignment: Alignment.center,
          child: SafeArea(
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    FilePickerResult? file = await FilePicker.platform
                        .pickFiles(allowMultiple: false);

                    try {
                      if (file != null) {
                        pdf = file.paths
                            .map((path) => File(path!))
                            .map((file) => file.path);
                      } else {
                        DialogBox(context, "No File Selected");
                      }
                    } catch (e) {
                      DialogBox(context, e.toString());
                    } finally {
                      setState(() {
                        DialogBox(context, "File Selected");
                        isLoading = false;
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: MediaQuery.of(context).padding,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(213, 93, 13, 1),
                        // border: Border.all(color: const Color.fromRGBO(250, 198, 61, 1),)
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: isLoading
                        ? const LinearProgressIndicator()
                        : const Text(
                            "Select File",
                            style: TextStyle(
                                fontFamily: "regular", color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                uploadTextField(context, 0.06, 0.9, "Book Title", title),
                const SizedBox(
                  height: 30,
                ),
                uploadTextField(
                    context, 0.15, 0.9, "Book Description", description),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    uploadTextField(context, 0.06, 0.4, "Page Number", pages),
                    const SizedBox(
                      height: 30,
                    ),
                    uploadTextField(context, 0.06, 0.4, "Language", language),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                uploadTextField(context, 0.06, 0.9, "Gmail Account", account),
                const SizedBox(
                  height: 30,
                ),
                uploadBtn(context, "Upload", () {
                  String id = account.text.toString();
                  fireStore.doc(id).set({
                    "file": pdf,
                    "title": title.text.toString(),
                    "description": description.text.toString(),
                    "pages": pages.text.toString(),
                    "language": language.text.toString(),
                    "account": account.text.toString()
                  }).then((value) => DialogBox(context, "Data Add SuccessFul"));
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
    );
  }
}
