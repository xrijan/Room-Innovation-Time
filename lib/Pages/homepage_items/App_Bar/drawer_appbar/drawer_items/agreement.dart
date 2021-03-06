import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class RoomIT_agreement extends StatefulWidget {
  const RoomIT_agreement({Key? key}) : super(key: key);

  @override
  State<RoomIT_agreement> createState() => _RoomIT_agreementState();
}

class _RoomIT_agreementState extends State<RoomIT_agreement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:
        Text("Agreement",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
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
