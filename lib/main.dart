import 'package:animalicu/auth/screen/loginui.dart';
import 'package:animalicu/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'VideoCall/videocall_screen.dart';
import 'auth/service/auth_service.dart';
import 'auth/service/user_provider.dart';
import 'dashboard/bottom_nav_bar.dart';
import 'dashboard/screen/dashboard.dart';
import 'doctor/screen/dashboard_doctor.dart';
import 'doctor/widget/bottom_nav_bar__doctor.dart';
import 'files/forms_presc.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    prepareData();
  }

  void prepareData() async {
    setState(() {
      authService.getUserData(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        routes: {
          VideoCallScreen.id: (context) =>  VideoCallScreen(),
        },
      home: splashscreen(),
      // home: Provider.of<UserProvider>(context).user.id!.isNotEmpty
      //     ? Provider.of<UserProvider>(context).user.type == 'Doctor'
      //         ? BottomBarDoctor()
      //         : const BottomBar()
      //     : loginScreen()
    );
  }
}


