import 'package:dev_rijan_room_it/Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'firebase_services/auth_controller.dart';
import 'firebase_services/firebase_auth.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  firebaseInitialization.then((value)
  {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Room Innovation Time',
      debugShowCheckedModeBanner: false,
      home:AnimatedSplashScreen(
          duration: 3000,
          splash: Lottie.asset("assets/lottie/102800-blue-circle.json", repeat: true, reverse: true, animate: true,),
          nextScreen: LoginScreen(),
          splashTransition: SplashTransition.fadeTransition,
          ),
    );
  }
}
