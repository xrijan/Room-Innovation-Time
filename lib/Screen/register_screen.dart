import 'package:dev_rijan_room_it/Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../firebase_services/auth_controller.dart';




class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  //For loading
  bool isLoading = false;

  //for Strong Password

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if(password.length >= 8)
        _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password))
        _hasPasswordOneNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height:300,
              width: 410,
              child: Lottie.asset("assets/lottie/38435-register.json",
                width: 200,
                height: 400,
              ),
            ),

            Container(
              height: 500,
              padding:  EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[

                  TextField(
                    controller: nameController,
                    decoration:  InputDecoration( labelText: "Name", labelStyle: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.bold, color: Colors.black),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),

                  SizedBox(height: 20,),

                  TextField(
                    controller: emailController,
                    decoration:  InputDecoration( labelText: "Email", labelStyle: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.bold, color: Colors.black),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)
                        )
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    onChanged: (password) => onPasswordChanged(password),
                    obscureText: !_isVisible,
                    controller: passwordController,
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

                  SizedBox(height: 30,),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _isPasswordEightCharacters ?  Colors.green : Colors.transparent,
                            border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                            Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                      ),
                      SizedBox(width: 10,),
                      Text("Contains at least 8 characters")
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _hasPasswordOneNumber ?  Colors.green : Colors.transparent,
                            border: _hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                            Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                      ),
                      SizedBox(width: 10,),
                      Text("Contains at least 1 number")
                    ],
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
                                :const Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Nunito"),),
                          )
                      ),
                    ),

                    onTap: () {
                      setState(() {isLoading = true;});

                      Future.delayed(const Duration(seconds: 3),()
                      {
                        setState(() {isLoading = false;});
                      });
                      // this is for the register function in auth controller
                      AuthController.authInstance.register(emailController.text.trim(),passwordController.text.trim(),
                      );
                    },
                  ),
                  // const SizedBox(height: 4.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}