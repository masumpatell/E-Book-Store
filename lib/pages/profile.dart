import 'package:flutter/material.dart';
import 'package:masumbook/pages/upload/upload.dart';
import 'package:masumbook/pages/weekly.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.46,
              // color: Colors.pink,
              child: Stack(
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(200),
                            bottomRight: Radius.circular(200)),
                        color: Color.fromRGBO(250, 198, 61, 1),
                      ),
                      child: const SafeArea(
                          child:
                              Text("profile", style: TextStyle(fontSize: 20)))),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.26,
                    left: MediaQuery.of(context).size.height * 0.12,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.46,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        child: Image.asset("assets/images/circle.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Row(
                children: [
                  const Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "95",
                        style: TextStyle(fontFamily: "regular"),
                      ),
                      Text(
                        "books you read",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )),
                  Container(
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                      child: Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "12",
                          style: TextStyle(fontFamily: "regular"),
                        ),
                        Text(
                          "books you saved",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )),
                  Container(
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                      child: Container(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2500",
                          style: TextStyle(fontFamily: "regular"),
                        ),
                        Text(
                          "coin you earned",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadFile()));
              },
                child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  border: Border.all(
                    color: const Color.fromRGBO(250, 198, 61, 1),
                  )),
              child: const Text(
                "Upload Book",
                style: TextStyle(
                    color: Color.fromRGBO(213, 93, 13, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )),
            SizedBox(height: 20,),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Weekly()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      border: Border.all(
                        color: const Color.fromRGBO(250, 198, 61, 1),
                      )),
                  child: const Text(
                    "Subscribe weekly newsletter",
                    style: TextStyle(
                        color: Color.fromRGBO(213, 93, 13, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
