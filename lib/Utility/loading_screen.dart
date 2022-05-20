import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Lottie.asset("assets/lottie/99297-loading-files.json",
         repeat: true,
         reverse: true,
         animate: true,
       ),
      ),
    );
  }
}
