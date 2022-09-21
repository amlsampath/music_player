import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_animation/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(
        microseconds: 1000,
      ),
      theme: ThemeData(
        fontFamily: 'Graphik',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () =>  HomeScreen()),
        
      ],
    );
  }
}
