
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../room_buyForm.dart';

class UD_Demo extends StatefulWidget {
  @override
  State<UD_Demo> createState() => _UD_DemoState();
}

class _UD_DemoState extends State<UD_Demo> {
  final String image = "assets/demo_rooms/1056541.jpg";

  _launchURL() async {
    const url = 'https://www.google.com/maps/d/edit?mid=1MZwweJnfKuda_dQGKyu-Z_2wBG9QITM&usp=sharing';
    await launch(url);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.asset(image, fit: BoxFit.cover)
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text("Lux Room\nUdaipur", style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold,fontFamily: "Nunito"),),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    SizedBox(height: 10,),
                    Spacer(),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: _launchURL,
                                  child: Text.rich(
                                    TextSpan(children: [

                                      WidgetSpan(
                                          child: Icon(Icons.location_on, size: 18.0, color: Colors.grey,)),
                                      TextSpan(text: " 8 km to centrum",)
                                    ]),
                                    style: TextStyle(color: Colors.grey, fontSize: 14.0,fontFamily: "Nunito"),),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text("\₹ 5000", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: "Nunito"),),
                              Text("/ per month",style: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: "Nunito"),)
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.black,
                          textColor: Colors.white,
                          child: Text("Book Now", style: TextStyle(fontWeight: FontWeight.normal,fontFamily: "Nunito"),),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (
                                  context) =>  BookForms()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),

                      Text("ROOM INFORMATION".toUpperCase(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0, fontFamily: "Nunito"),),

                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("AREA",style: TextStyle(fontFamily: "Nunito",fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("132 sq.ft",style: TextStyle(fontFamily: "Nunito")),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Bathroom",style: TextStyle(fontFamily: "Nunito",fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Common",style: TextStyle(fontFamily: "Nunito")),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Floor",style: TextStyle(fontFamily: "Nunito",fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("2nd",style: TextStyle(fontFamily: "Nunito")),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      Text("Description".toUpperCase(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0, fontFamily: "Nunito"),),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          fontFamily: "Nunito"
                      ),),
                      const SizedBox(height: 10.0),
                      Text(
                        "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0,
                          fontFamily: "Nunito"
                      ),),
                      const SizedBox(height: 10.0),
                      Text("FACILITIES".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          fontFamily: "Nunito"
                      ),),
                      SizedBox(height: 10,),
                      Text("Parking: Yes\n"
                          "Bills Included: Yes\n",style: TextStyle(fontFamily: "Nunito"),),
                      const SizedBox(height: 10.0),
                      Text("Rules / Restriction".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                          fontFamily: "Nunito"
                      ),),
                      SizedBox(height: 10,),
                      Text("Night Entry: Allowed\n"
                          "Non Veg : Allowed\n",style: TextStyle(fontFamily: "Nunito"),),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("Dummy Room",style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal
              ),),
            ),
          ),
        ],
      ),
    );
  }



}