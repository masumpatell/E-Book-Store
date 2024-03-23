import 'package:flutter/material.dart';

btn(String text) {
  return InkWell(
      child: Container(
    alignment: Alignment.center,
    height: 35,
    width: 90,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
        border: Border.all(color: const Color.fromRGBO(250, 198, 61, 1),)
    ),
    child: Text(
      text,
      style:
          const TextStyle(color: Color.fromRGBO(213, 93, 13, 1), fontSize: 20,fontWeight: FontWeight.bold),
    ),
  ));
}
