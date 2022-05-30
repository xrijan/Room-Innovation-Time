import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class BookForms extends StatefulWidget {
  const BookForms({Key? key}) : super(key: key);

  @override
  State<BookForms> createState() => _BookFormsState();
}

class _BookFormsState extends State<BookForms> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final RoomCodeController = TextEditingController();
  final priceController = TextEditingController();

  bool isButtonActive = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:
        Text("Book Room",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
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
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  //Name
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Name / As per AddharCard",
                        labelStyle: TextStyle(fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  //Email
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Login Email",
                        labelStyle: TextStyle(fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                  //Number
                  TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Contact Number",

                        labelStyle: TextStyle(fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),
                  const SizedBox(height: 30),
                  //Room Code
                  TextField(
                    controller: RoomCodeController,
                    decoration: InputDecoration(labelText: "Room Code",
                        hintText: "#UD-27000",
                        labelStyle: TextStyle(fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),
                  SizedBox(height: 30,),
                    //price
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Bid Price (Rs.)",
                        labelStyle: TextStyle(fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
            //   child: InkWell(
            //     child: SizedBox(
            //       height: 50.0,
            //       child: Material(
            //           borderRadius: BorderRadius.circular(15.0),
            //           shadowColor: Colors.black,
            //           color: Colors.black,
            //           // onSurface: Colors.blueGrey,
            //           elevation: 7.0,
            //           child: Center(
            //             child:  Text("Book Now", style: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold,
            //                 fontFamily: "Nunito"),),
            //           )
            //       ),
            //     ),
            //     onTap: isButtonActive ? () {
            //
            //
            //       setState(()=> isButtonActive=false);
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text("Booking Under Review"))
            //       );
            //       final user = User(
            //         name: nameController.text,
            //         email: emailController.text,
            //         number: numberController.text,
            //         RoomCode: RoomCodeController.text,
            //         BidPrice: priceController.text,
            //
            //       );
            //       createUser(user);
            //     }:null,
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.fromLTRB(110, 0, 110, 0),
              child: SizedBox(
                width: 200.0,
                height: 48.0,
                child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: Colors.black,
                       onSurface: Colors.blueGrey,
                       shape: new RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(20.0),
                       ),

                     ),
                    onPressed: isButtonActive ? () {

                      setState(()=> isButtonActive=false);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Booking Under Review"))
                      );
                      final user = User(
                        name: nameController.text,
                        email: emailController.text,
                        number: numberController.text,
                        RoomCode: RoomCodeController.text,
                        BidPrice: priceController.text,

                      );
                      createUser(user);
                    }:null,

                    child: Center(
                      child:  Text("Book Now", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Nunito"),),
                    ),),
              ),
            )
          ],
        ),

      ),

    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection("Booked").doc();

    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  final String name;
  final String email;
  final String number;
  final String RoomCode;
  final String BidPrice;

  User({
    required this.name,
    required this.email,
    required this.number,
    required this.RoomCode,
    required this.BidPrice,

  });
  Map<String,dynamic> toJson() =>{
    "Name":name,
    "Login Email":email,
    "Contact Number":number,
    "Room Code":RoomCode,
    "Demand Price":BidPrice,
  };
}

