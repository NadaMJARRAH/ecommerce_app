import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, '/on_boarding_screen');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Color(0xFF272459),
                Color(0xFFF35C56),
              ]),
        ),
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(bottom: 14),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('images/shop_logo.png')),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Text('Elektra',style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
                height: 1
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
