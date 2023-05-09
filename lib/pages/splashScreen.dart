import 'package:crex/dashboard/home_dashboard.dart';
import 'package:crex/pages/cricket_home.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    super.initState();
    _navigatehome();
  }
  _navigatehome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
   
    Navigator.pushReplacement(
          (context),
          MaterialPageRoute(
            builder: (context) => const home_dashboard(),
          ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF2E00),
      body: Center(child: Image.asset("assets/icon.jpg", scale: 1,),),
    );
  }
}