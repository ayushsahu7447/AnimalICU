import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'auth/screen/loginui.dart';
import 'auth/service/user_provider.dart';
import 'dashboard/bottom_nav_bar.dart';
import 'doctor/widget/bottom_nav_bar__doctor.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                Provider.of<UserProvider>(context).user.email.isNotEmpty
                    ? Provider.of<UserProvider>(context).user.type == 'Doctor'
                    ? BottomBarDoctor()
                    : BottomBar()
                    : loginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo[700],elevation: 0,),
      body: Container(
        color: Colors.indigo[700],
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height/40,),
              Image.asset("assets/png/animalicublue.png", height: size.height/2,),
              SizedBox(height: size.height/70,),

              Lottie.asset("assets/lottie/onine_doctor.json", height: size.height/6, fit: BoxFit.fill),


            ],
          ),
        ),
      ),
    ));
  }
}
