import 'package:appc/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SizedBox(
      width: Get.width,
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Image.asset("assets/bot.png"),
        const Text("Welcome",style: TextStyle(fontSize: 60)),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
        GetStorage().write("wel", "f");
        Get.off(HomeScreen());
        },style:ButtonStyle(fixedSize:MaterialStateProperty.all(Size(Get.width/2,Get.height/25)) ) , child: const Text("lest go",style: TextStyle(fontSize: 50),),)
      ]),
    ),

    );

  }
}