import 'package:flutter/material.dart';
import 'package:masumbook/comon/btn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../account/option.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final one = ValueNotifier<bool>(false);
  final two = ValueNotifier<bool>(false);
  final three = ValueNotifier<bool>(false);
  final forth = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: const Text("Setting",style: TextStyle(fontFamily: "regular"),)),
            const SizedBox(height: 50,),
            Container(
              // color: Colors.green,
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.person_2_outlined),
                      SizedBox(width: 10,),
                      Text("account",style: TextStyle(fontFamily: "regular",fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.13,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("edit profile",style: TextStyle(fontFamily: "regular"),),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("change password",style: TextStyle(fontFamily: "regular"),),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("change email",style: TextStyle(fontFamily: "regular"),),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Row(
                    children: [
                      Icon(Icons.circle_notifications_outlined),
                      SizedBox(width: 10,),
                      Text("notification",style: TextStyle(fontFamily: "regular",fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.165,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("email notification",style: TextStyle(fontFamily: "regular"),),
                            Container(
                              padding: EdgeInsets.only(bottom: 2),
                              child: AdvancedSwitch(
                                controller: one,
                                activeColor: Colors.green,
                                inactiveColor: Colors.grey,
                                activeChild: const Text('ON',style: TextStyle(fontSize: 10),),
                                inactiveChild: const Text('OFF',style: TextStyle(fontSize: 10),),
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                width: 45.0,
                                height: 25.0,
                                enabled: true,
                                disabledOpacity: 0.5,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("weekly newsletter",style: TextStyle(fontFamily: "regular"),),
                            Container(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: AdvancedSwitch(
                                controller: two,
                                activeColor: Colors.green,
                                inactiveColor: Colors.grey,
                                activeChild: const Text('ON',style: TextStyle(fontSize: 10),),
                                inactiveChild: const Text('OFF',style: TextStyle(fontSize: 10),),
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                width: 45.0,
                                height: 25.0,
                                enabled: true,
                                disabledOpacity: 0.5,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("app notification",style: TextStyle(fontFamily: "regular"),),
                            Container(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: AdvancedSwitch(
                                controller: three,
                                activeColor: Colors.green,
                                inactiveColor: Colors.grey,
                                activeChild: const Text('ON',style: TextStyle(fontSize: 10),),
                                inactiveChild: const Text('OFF',style: TextStyle(fontSize: 10),),
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                width: 45.0,
                                height: 25.0,
                                enabled: true,
                                disabledOpacity: 0.5,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("app mode",style: TextStyle(fontFamily: "regular"),),
                            AdvancedSwitch(
                              controller: forth,
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                              activeChild: const Icon(Icons.light_mode_outlined,size: 15,),
                              inactiveChild: const Icon(Icons.dark_mode_outlined,size: 15,),
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              width: 45.0,
                              height: 25.0,
                              enabled: true,
                              disabledOpacity: 0.5,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Row(
                    children: [
                      Icon(Icons.more_horiz),
                      SizedBox(width: 10,),
                      Text("more",style: TextStyle(fontFamily: "regular",fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.13,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("languages",style: TextStyle(fontFamily: "regular"),),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("delete account",style: TextStyle(fontFamily: "regular"),),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                        InkWell(
                          onTap: () async{
                            var shared = await SharedPreferences.getInstance();
                            shared.remove("email");
                            shared.remove("gmail");
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const OptionPage(),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("log out",style: TextStyle(fontFamily: "regular"),),
                              Icon(Icons.navigate_next)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
