
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../firebase_services/auth_controller.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  bool isLoading = false;
  bool isPasswordReset = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(

          appBar: AppBar(
            title:
            Text("Forget Password",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 60,),
                Container(
                    height:300,
                    width: 410,
                    child: Lottie.asset("assets/lottie/75971-forgot-password.json")),

                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: TextField(
                    controller: emailController,
                    decoration:  InputDecoration( labelText: "Email", labelStyle: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.bold, color: Colors.black),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: InkWell(
                    child: SizedBox(
                      height: 60.0,
                      child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.black,
                          color: Colors.black,
                          elevation: 7.0,
                          child:  Center(
                            child: isLoading?  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Wait a Second..",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Nunito")),
                                SizedBox(width: 20,),
                                CircularProgressIndicator(color: Colors.white,strokeWidth: 4,),
                              ],
                            )
                                :const Text("Send Email", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
                          )
                      ),
                    ),

                    onTap: () {
                      setState(() {isLoading = true;});

                      Future.delayed(const Duration(seconds: 3),()
                      {
                        setState(() {isLoading = false;});
                      });
                      // this is for the login function in auth controller
                      AuthController.authInstance.forget(emailController.text.trim());
                    },
                  ),
                ),
              ],
            ),
          ),
        )

      ),
    );
  }
}
