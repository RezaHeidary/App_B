import 'package:appc/view/home_page.dart';
import 'package:appc/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp (
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: GetStorage().read("wel")=="f"?HomeScreen() :const WelcomeScreen(),
    );
  }
}
