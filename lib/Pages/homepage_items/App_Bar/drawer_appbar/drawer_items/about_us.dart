import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class About_RoomIT extends StatefulWidget {
  const About_RoomIT({Key? key}) : super(key: key);

  @override
  State<About_RoomIT> createState() => _About_RoomITState();
}

class _About_RoomITState extends State<About_RoomIT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:
        Text("Room IT",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
          child:

          InkWell(
              onTap:  () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/icons/left-arrow.png",)),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Lottie.asset("assets/lottie/94286-website-under-construction.json",
              repeat: true,
              animate: true,
            ),
          ),
        ],
      ),
    );
  }
}
