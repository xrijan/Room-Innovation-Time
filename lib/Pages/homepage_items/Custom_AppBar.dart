import 'package:flutter/material.dart';

import '../../firebase_services/auth_controller.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 20.0, right: 27.0,bottom: 0),
      child: Container(
        height: size.height * 0.23,
        child:

        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.sort_rounded),
                ),
                Container(
                  height: 25,
                  width: 50,
                  child: Image.asset("assets/icons/love.png"),
                ),
              ],
            ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('City',style: TextStyle(color: Colors.black, fontSize: 18,),),
                  SizedBox(height: size.height * 0.01,),
                  // Text('Udaipur',style: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),),
                  // SizedBox(width: 100,),
                  Row(
                    children: [
                      Text('Udaipur',style: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),),
                      SizedBox(width: 17,),
                      InkWell(
                        onTap: () {
                          AuthController.authInstance.signOut();
                        },
                        child: Container(
                            width: 24,
                            child: Image.asset("assets/icons/explore.png")),
                      ),
                    ],
                  )


                ],),),
               Divider(
                 color: Colors.blueGrey,
               )
          ],
        ),
      ),
    );
  }
}
