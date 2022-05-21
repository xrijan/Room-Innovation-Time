import 'package:dev_rijan_room_it/Pages/home_page.dart';
import 'package:dev_rijan_room_it/Pages/homepage_items/drawer_appbar/drawer_items/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../firebase_services/auth_controller.dart';



class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidget();
}

class _DrawerWidget extends State<DrawerWidget> {

  final padding = const EdgeInsets.symmetric(horizontal: 20);

  _launchURL() async {
    const url = 'https://docs.google.com/forms/d/e/1FAIpQLSf5QSn2THXyR7wQM82HNPRL6sQJ1mbRhxxXeboeJWu9VOHZjQ/viewform?usp=sf_link';
    await launch(url);
  }


  @override
  Widget build(BuildContext context) {

    const name = "Email ID";
    final email = FirebaseAuth.instance.currentUser!.email;
    const Image = "assets/utility_image/cute-g85c8e3e53_1920.png";


    return  Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,0,30,0),
        child: Material(
          color: Colors.transparent,
          child: ListView(
            children: <Widget>[
              buildHeader(

                Image: Image,
                name: name,
                email : email,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: const Divider(color: Colors.black,),
              ),
              const SizedBox(height: 35),

              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuItem(

                      text: "Home",
                      icon: Icons.home,
                      onClicked: () => selectedItem(context,1),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuItem(
                      text: "Rent",
                      icon: Icons.apartment,
                      onClicked: _launchURL,
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 16),

              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuItem(
                      text: "Notification",
                      icon: Icons.notifications,
                      onClicked: () => selectedItem(context,1),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuItem(
                      text: "Agreement",
                      icon: Icons.description,
                      onClicked: () => selectedItem(context,2),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 67),

              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: const Divider(color: Colors.black,),
              ),

              const SizedBox(height: 80),

              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuItem(
                      text: "Check Updates",
                      icon: Icons.ad_units_outlined,
                      onClicked: () => selectedItem(context,3),
                    ),
                  ],
                ),
              ),

              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuItem(
                      text: "Settings",
                      icon: Icons.settings,
                      onClicked: () => selectedItem(context,3),
                    ),
                  ],
                ),
              ),

              Container(
                padding: padding,
                child: Column(
                  children: [
                    buildMenuItem(
                      text: "Log Out",
                      icon: Icons.logout,
                      onClicked: () {
                        AuthController.authInstance.signOut();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  Widget buildHeader(
      {
        required String Image,
        required String name,
        required String? email,

      }
      )
  => InkWell(
    child: Container(
      padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
      child: Row(

        children: [
          CircleAvatar(radius: 27,backgroundImage: AssetImage(Image)),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 16,color: Colors.black,fontFamily: "Nunito"),
              ),
              const SizedBox(height: 4),
              Text(
                email!,
                style: const TextStyle(fontSize: 10,color: Colors.black,fontFamily: "Nunito"),
              ),
            ],
          ),
          const Spacer(),
           InkWell(
             onTap: () {
               Navigator.of(context).push(
                 MaterialPageRoute(builder: (
                     context) =>  ProfileUpdate()),
               );
             },
            // backgroundColor: Colors.transparent,
            child: Container(
                child: Icon(Icons.exit_to_app, color: Colors.black)),
          )
        ],
      ),
    ),
  );

  Widget buildMenuItem(
      {
        required String text,
        required IconData icon,
        VoidCallback? onClicked,
      }) {
    final color = Colors.black;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color,fontFamily: "Nunito")),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index){
    Navigator.of(context).pop();
    switch (index) {

      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const HomePage(),
        // ));
        break;

      case 2:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Agreement(),
        // ));
        break;

      case 3:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const Setting(),
        // ));
        break;

    }

  }

}


