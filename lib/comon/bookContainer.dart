import 'package:flutter/material.dart';

bookContainer(context,String img,String title,String name,String type,String data){
  return Container(
    height: MediaQuery.of(context).size.height*0.135,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(248, 248, 247, 1)),
    child: Row(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 10),
            height: 80,
            child: Image.asset(img)),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: const TextStyle(fontFamily: "regular",fontSize: 20),),
              Text(name,style: const TextStyle(fontFamily: "regular",fontSize: 12,fontWeight: FontWeight.w100,color: Colors.grey),),
              Text(type,style: const TextStyle(fontFamily: "regular",fontSize: 12,fontWeight: FontWeight.w100,color: Colors.grey),),
              Text(
                data,style: const TextStyle(fontSize: 10),),
              SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.topRight,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(213, 93, 13, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30))),
                      child: const Text(
                        "Read",
                        style:
                        TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}