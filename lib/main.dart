import 'package:ecommerce_app/modules/auth/login_screen.dart';
import 'package:ecommerce_app/modules/launch/launch_screen.dart';
import 'package:ecommerce_app/modules/launch/on_boarding_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen() ,
        '/on_boarding_screen': (context) => const OnBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),


      },
    );
  }
}
