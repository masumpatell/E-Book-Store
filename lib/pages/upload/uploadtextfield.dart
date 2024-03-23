import 'package:flutter/material.dart';

uploadTextField(context,double height,double width,String hint,TextEditingController controller){
  return Container(
    padding: const EdgeInsets.only(left: 10),
    height: MediaQuery.of(context).size.height*height,
    width: MediaQuery.of(context).size.width*width,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      border: Border.all(color: const Color.fromRGBO(250, 198, 61, 1),),
      borderRadius: BorderRadius.circular(15)
    ),
    child: TextField(
      controller: controller,
      maxLines: null,
      textInputAction: TextInputAction.newline,
      style: const TextStyle(fontFamily: "regular"),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontFamily: "regular"),
        border: InputBorder.none,
      ),
    ),
  );
}

uploadBtn(context,String text,VoidCallback onTap){
  return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height*0.06,
        width: MediaQuery.of(context).size.width*0.9,
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