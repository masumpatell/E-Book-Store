import 'package:flutter/material.dart';
import 'package:masumbook/pages/readbook/read.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //Search
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(250, 198, 61, 1)),
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.67,
                        child: const TextField(
                          decoration: InputDecoration(border: InputBorder.none,hintText: "Search...",hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              //Container
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 15),
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 198, 61, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      // color: Colors.grey,
                      margin: const EdgeInsets.only(bottom: 20, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "ready for a",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 2,
                                fontFamily: "regular"),
                          ),
                          const Text(
                            "journey?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                letterSpacing: 2,
                                fontFamily: "regular"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                              child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 90,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(213, 93, 13, 1),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            child: const Text(
                              "read",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/dragon.png", height: 138),
                  ],
                ),
              ),
              //2 Box
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                // color: Colors.grey,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "books",
                            style:
                                TextStyle(fontFamily: "regular", fontSize: 20),
                          ),
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: 140,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(252, 227, 161, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset("assets/images/op1.png"),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "audio books",
                            style:
                                TextStyle(fontFamily: "regular", fontSize: 20),
                          ),
                          Container(
                            height: 140,
                            width: 170,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(66, 116, 135, 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset("assets/images/op2.png"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //full Container
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("recommended",
                        style: TextStyle(fontFamily: "regular", fontSize: 20)),
                    Container(
                      height: MediaQuery.of(context).size.height*0.12,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(248, 248, 247, 1)),
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 80,
                              child: Image.asset("assets/images/book1.png")),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("unseen world",style: TextStyle(fontFamily: "regular",fontSize: 20),),
                                const Text("by: Masum Patel",style: TextStyle(fontFamily: "regular",fontSize: 12,fontWeight: FontWeight.w100,color: Colors.grey),),
                                const Text("science",style: TextStyle(fontFamily: "regular",fontSize: 12,fontWeight: FontWeight.w100,color: Colors.grey),),
                                const Text(
                                    "sara is a little girl who living with her mom. she loves animals. one day when shes playing with her imaginary friend....  ",style: TextStyle(fontSize: 10),),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  alignment: Alignment.topRight,
                                  width: MediaQuery.of(context).size.width,
                                  child: InkWell(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 15,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(213, 93, 13, 1),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30),
                                                bottomLeft: Radius.circular(30))),
                                        child: const Text(
                                          "read",
                                          style:
                                          TextStyle(color: Colors.white, fontSize: 5),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Last Container
              Container(
                margin: const EdgeInsets.only(left: 25, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("remaining",style: TextStyle(fontFamily: "regular", fontSize: 20)),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookReadingView(bObj: {"name":"unseen world"},)));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 90,
                              child: Image.asset("assets/images/2-1.png"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookReadingView(bObj: {"name" : "a place called perfect"},)));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 90,
                              child: Image.asset("assets/images/2-2.png"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookReadingView(bObj: {"name" : "great happiness"},)));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 90,
                              child: Image.asset("assets/images/1-3.png"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookReadingView(bObj: {"name" : "theres a hole in my galaxy"},)));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 90,
                              child: Image.asset("assets/images/1-4.png"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
