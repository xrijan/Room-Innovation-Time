
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {

  final  name = "Enrico";
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("Profile",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [

              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/utility_image/Mrwithmask.jpg") )),
                    ),
                    //uploading the avtar
                    //
                    // Positioned(
                    //     bottom: 0,
                    //     right: 0,
                    //     child: Container(
                    //       height: 40,
                    //       width: 40,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //           width: 4,
                    //           color: Theme.of(context).scaffoldBackgroundColor,
                    //         ),
                    //         color: Colors.black,
                    //       ),
                    //       child: Icon(
                    //         Icons.edit,
                    //         color: Colors.white,
                    //       ),
                    //     )),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              Container(
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      child: Text("Name : ",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Nunito",fontSize: 20),),
                    ),
                    Text(name,style: TextStyle(color: Colors.black, fontFamily: "Nunito"),),
                  ],
                ),
              ),

              Container(
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      child: Text("User Id : ",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Nunito",fontSize: 20),),
                    ),
                    Text(uid ,style: TextStyle(color: Colors.black, fontFamily: "Nunito"),),
                  ],
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      child: Text("Email : ",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Nunito",fontSize: 20),),
                    ),
                    Text(email!,style: TextStyle(color: Colors.black, fontFamily: "Nunito"),),
                  ],
                ),
              ),

              // Container(
              //   height: 40,
              //   child: Text(creationTimeString,style: TextStyle(color: Colors.black, fontFamily: "Nunito"),),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
