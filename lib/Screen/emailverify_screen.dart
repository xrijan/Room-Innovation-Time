import 'dart:async';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Pages/home_page.dart';
import '../firebase_services/auth_controller.dart';



class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => EmailVerifyState();
}

class EmailVerifyState extends State<EmailVerify> {

  bool isLoading = false;
  bool canResendEmail = false;
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
          (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
     try{
      final user = FirebaseAuth.instance.currentUser!;

      await user.sendEmailVerification();

       setState(() => canResendEmail = false);

      await Future.delayed(Duration(seconds: 5));
       setState(() => canResendEmail = true);
    }
    on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);

      Get.snackbar(
        "Something Went Wrong",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }


  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

      setState((){
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }


  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomePage()
      :
         Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child:
        Column(
          children: <Widget>[
            //Lottie
            SizedBox(height: 50,),

            Container(
              height:300,
              width: 410,
              child: Lottie.asset("assets/lottie/72126-email-verification.json",
                width: 200,
                height: 400,
              ),
            ),

            Container(
              child: Text("The Verification Email has been sent to your given Email.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "Nunito")),
            ),
            //Email,Password and More..
                  const SizedBox(height: 40.0),

            Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Container(
                child: Column(
                  children: [
                    InkWell(
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
                                        :const Text("Resend Email", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
                                  )
                              ),
                            ),
                            onTap:
                            canResendEmail ? sendVerificationEmail : null,
                          ),
                    SizedBox(height: 30,),
                    InkWell(
                      child: Container(
                        height: 60.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  <Widget>[
                              Center(

                                child: Container(
                                  alignment: const Alignment(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.0, left: 20.0),
                                    child: Text("Cancel",
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          fontFamily: "Nunito"),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        AuthController.authInstance.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
  );

}
