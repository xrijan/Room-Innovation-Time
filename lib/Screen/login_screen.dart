import 'package:dev_rijan_room_it/Screen/register_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../firebase_services/auth_controller.dart';
import 'forgetpassword_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //For the password visibility
  bool _isVisible = false;
  bool isLoading = false;

  void _showalertDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Sorry!!!",style: TextStyle(fontFamily: "Nunito")),
            content: Text("We are working on this feature !\nIt is expected to be available in next update",style: TextStyle(color: Colors.red,fontFamily: "Nunito")),
            actions: [
              MaterialButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Back", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Nunito",color: Colors.blueGrey,),
              ),
              )],

          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body:
      SingleChildScrollView(
        child:
        SafeArea(
          child: Column(
          children: <Widget>[
           //Lottie
            SizedBox(height: 50,),

            Container(
              height:300,
              width: 410,
              child: Lottie.asset("assets/lottie/78126-secure-login.json",
                width: 200,
                height: 400,
              ),
            ),
            //Email,Password and More..
            Container(
              height: 400,
               padding:  EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
               child: Column(
                 children: <Widget>[

                   TextField(
                     controller: emailController,
                     decoration:  InputDecoration( labelText: "Email", labelStyle: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.bold, color: Colors.black),
                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)
                         )
                     ),
                   ),

                   const SizedBox(height: 20),

                   TextField(
                     controller: passwordController,

                     obscureText: !_isVisible,

                     decoration:  InputDecoration(
                         suffixIcon: IconButton(
                           onPressed: () {
                             setState(() {
                               _isVisible = !_isVisible;
                             });
                           },
                           icon: _isVisible ? Icon(Icons.visibility, color: Colors.black,) :
                           Icon(Icons.visibility_off, color: Colors.grey,),),
                         labelText: "Password", labelStyle: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.bold, color: Colors.black),
                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)
                         )
                     ),
                   ),

                   const SizedBox(height: 40.0),

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
                                 :const Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
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
                        AuthController.authInstance.login(emailController.text.trim(), passwordController.text.trim(),);
                     },
                   ),

                   const SizedBox(height: 3,),

                   Container(
                     alignment: const Alignment(1.0, 0.0),
                     padding: const EdgeInsets.only(top: 15.0, left: 20.0),

                     child: InkWell(
                         onTap: () {
                           Navigator.of(context).push(
                             MaterialPageRoute(builder: (
                                 context) => const ForgetPassword()),
                           );
                         },
                         child: const Text("Forgot Password", style: TextStyle(
                           color: Colors.blueGrey,
                           fontWeight: FontWeight.bold,
                           fontFamily: "Nunito",
                           decoration: TextDecoration.underline,))
                     ),
                   ),

                   const SizedBox(height: 10,),

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
                                   child: Text("Log in with google",
                                     style: TextStyle(fontWeight: FontWeight.bold,
                                         fontFamily: "Nunito"),),
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                     onTap: _showalertDialog,
                   ),
                     // const SizedBox(height: 4.0),
                 ],
               ),
            ),
            //Sign Up
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("New to Room IT ?",
                    style: TextStyle(fontFamily: "Nunito"),
                  ),

                  const SizedBox(width: 15.0),

                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      child: const Text("Register", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Nunito",color: Colors.blueGrey,
                          decoration: TextDecoration.underline),)
                  ),
                ],
              ),
            ),

             const SizedBox(height: 59),
            //dialogue
            Container(
              // height: 200,
              child: Text("Powered By   “ARRAY”"),
            ),
          ],
          ),
        ),
      )

    );

  }
}
