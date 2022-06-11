
import 'package:dev_rijan_room_it/Pages/homepage_items/room_work/room_buyForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Utility/loading_screen.dart';
import 'drawer_items/about_us.dart';
import 'drawer_items/agreement.dart';
import 'drawer_items/services.dart';
import 'drawer_items/settings.dart';
import 'drawer_items/update_profile.dart';



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
  late final  String name = "Enrico";
  final email = FirebaseAuth.instance.currentUser!.email;
  static const ImageAvtar = "assets/utility_image/Mrwithmask.jpg";

  @override
  Widget build(BuildContext context) {

    return  StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Drawer(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,0,30,0),
            child: Material(
              color: Colors.transparent,
              child: ListView(
                children: <Widget>[
                  buildHeader(
                    Image: ImageAvtar,
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
                          // Image: Image(image: AssetImage("assets/icons/help.png")),
                          icon: Icons.home,
                          onClicked: () {
                            Navigator.pop(context);
                          },
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
                          // Image: Image(image: AssetImage("assets/icons/help.png")),
                          icon: Icons.cabin_rounded,
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
                          text: "Book",
                          // Image: Image(image: AssetImage("assets/icons/help.png")),
                          icon: Icons.bedroom_parent_rounded,
                          onClicked: () => selectedItem(context,2),
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
                          text: "Services",
                          // Image: Image(image: AssetImage("assets/icons/help.png")),
                          icon: Icons.cleaning_services,
                          onClicked: () => selectedItem(context,3),
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
                          // Image: Image(image: AssetImage("assets/icons/help.png")),
                          icon: Icons.feed_outlined,
                          onClicked: () => selectedItem(context,7),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: const Divider(color: Colors.black,),
                  ),

                  const SizedBox(height: 40),
                  Container(
                    padding: padding,
                    child: Column(
                      children: [
                        buildMenuItem(
                          text: "Settings",
                          // Image: Image(image: AssetImage("assets/icons/privacy-policy.png")),
                          icon: Icons.settings,
                          onClicked: () => selectedItem(context,4),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: padding,
                    child: Column(
                      children: [
                        buildMenuItem(
                          text: "Check Updates",
                          // Image: Image(image: AssetImage("assets/icons/help.png")),
                          icon: Icons.ad_units_outlined,
                          onClicked: () => selectedItem(context,5),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: padding,
                    child: Column(
                      children: [
                        buildMenuItem(
                          text: "About Us",
                          // Image: Image(image: AssetImage("assets/icons/help.png")),
                          icon: Icons.android_sharp,
                          onClicked: () => selectedItem(context,6),
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
                name, style: const TextStyle(fontSize: 16,color: Colors.black,fontFamily: "Nunito"),),
              const SizedBox(height: 4),
              Text(email!, style: const TextStyle(fontSize: 10,color: Colors.black,fontFamily: "Nunito"),),
            ],
          ),
        ],
      ),
    ),
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProfileUpdate(),
      ));
    },
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
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProfileUpdate(),
        ));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BookForms(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  OfferServices(),
        ));
        break;

      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  AppSettings(),
        ));
        break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  Loading(),
        ));
        break;

      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  About_RoomIT(),
        ));
        break;

      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  RoomIT_agreement(),
        ));
        break;
    }
  }
}


