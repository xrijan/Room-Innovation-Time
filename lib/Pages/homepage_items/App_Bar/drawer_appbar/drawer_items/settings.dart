import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../firebase_services/auth_controller.dart';


class AppSettings extends StatefulWidget {
  static const String path = "lib/src/pages/settings/settings1.dart";

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  late bool _dark;
  launchurl() async{
    launch('mailto:tanishqsharma27dec@gmail.com?subject=Developer support%20');
  }
  launchprivacy() async{
    launch('https://docs.google.com/document/d/1Cr3JwMs69UmtvaoqOa2ejOgnBz8R0s9I2cm8vXJFiQE/edit');
  }
  launchterms() async{
    launch('https://xtits.com');
  }

  bool val = false;

  @override
  void initState() {
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }


  void _showlogoutDialog(){
    showDialog(
        context: context,
        builder: (context){
          return CupertinoAlertDialog(
            title: Text("Logout"),
            content: Text("See you again!"),
            actions: [
              MaterialButton(
                onPressed: (){
                  AuthController.authInstance.signOut();
                },
                child: Text("Ok"),
              ),
              MaterialButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],

          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            'Settings',
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  setState(() {
                    _dark = !_dark;
                  });
                },
                child: Container(
                  width: 30,
                  child: Image.asset("assets/icons/theme.png"),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(3.0, 1.0, 1.0, 9.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                           leading: Padding(
                             padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
                             child: Image.asset("assets/icons/coding.png",),
                           ),
                          title: const Text("Contact developer"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: launchurl,
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
                            child: Image.asset("assets/icons/privacy-policy.png",),
                          ),
                          title: const Text("Privacy Policy"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap:  launchprivacy,
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
                            child: Image.asset("assets/icons/terms-and-conditions.png",),
                          ),
                          title: const Text("Terms and Conditions"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap:  launchterms,
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
                            child: Image.asset("assets/icons/help.png",),
                          ),
                          title: const Text("Help"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change location
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 550,
              right: 130,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  height: 50,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onSurface: Colors.blueGrey,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),

                    ),
                    onPressed: _showlogoutDialog,

                    child:  Center(
                    child:  Text("Log Out", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito"),),
                  ),),
                ),
              ),
            ),

            Container(),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}