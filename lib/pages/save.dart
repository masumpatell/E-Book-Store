import 'package:flutter/material.dart';
import 'package:masumbook/comon/bookContainer.dart';
import 'package:masumbook/comon/btn.dart';

class Save extends StatefulWidget {
  const Save({super.key});

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  List img = [
    "assets/images/22-1.png",
    "assets/images/22-2.png",
    "assets/images/22-3.png",
    "assets/images/22-4.png",
    "assets/images/22-2.png",
    "assets/images/22-3.png",
    "assets/images/22-4.png",
    "assets/images/22-1.png",
    "assets/images/22-3.png",
    "assets/images/22-4.png",
    "assets/images/22-1.png",
    "assets/images/22-2.png",
    "assets/images/22-4.png",
    "assets/images/22-1.png",
    "assets/images/22-2.png",
    "assets/images/22-3.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text(
                    "saved",
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 15,
                  right: 10,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      btn("science"),
                      btn("history"),
                      btn("tech"),
                      btn("novel"),
                      btn("science"),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "books",
                          style: TextStyle(fontFamily: "regular", fontSize: 20),
                        ),
                        Text("more")
                      ],
                    ),
                    bookContainer(
                        context,
                        "assets/images/2-1.png",
                        "great happiness",
                        "by: Heel Patel",
                        "History",
                        "sara is a little girl who living with her mom. she loves animals. one day when shes playing with her imaginary friend....  "),
                    const SizedBox(
                      height: 10,
                    ),
                    bookContainer(
                        context,
                        "assets/images/2-2.png",
                        "a place called perfect",
                        "by:Mihir Patel",
                        "Science",
                        "sara is a little girl who living with her mom. she loves animals. one day when shes playing with her imaginary friend....  "),
                    const SizedBox(
                      height: 10,
                    ),
                    bookContainer(
                        context,
                        "assets/images/2-3.png",
                        "theres a hole in my galaxy",
                        "by: Jeel Darji",
                        "technology",
                        "sara is a little girl who living with her mom. she loves animals. one day when shes playing with her imaginary friend....  ")
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "audio books",
                          style: TextStyle(fontFamily: "regular", fontSize: 20),
                        ),
                        Text("more")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: img.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ),
                  itemBuilder: (context, index) {
                    return Image.asset(img[index],);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
