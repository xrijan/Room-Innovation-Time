import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class About_RoomIT extends StatefulWidget {
  const About_RoomIT({Key? key}) : super(key: key);

  @override
  State<About_RoomIT> createState() => _About_RoomITState();
}

class _About_RoomITState extends State<About_RoomIT> {

  _launchTwitterURL() async {
    const url = 'https://twitter.com/roomit_official';
    await launch(url);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
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
        child: Column(
          children: [
            Stack(
              children: [

                Image.asset("assets/utility_image/theme_room_it.jpg",
                ),
                Container(
                  height:300,
                  child: Center(child: Text("ABOUT  US",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: "Nunito",color: Colors.white))),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Container(

                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("ROOM INNOVATION TIME (ROOM IT)",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("IS A STANDARD BUDGET ROOM RENTING CHAIN THAT HELPS IN FINDING AFFORDABLE AND TRUSTED ROOMS/PG FOR RENT THAT CAN BE BOOKED BOTH INSTANTLY AND EASILY.WE BRAND UNBRANDED ROOMS AND OFFER STANDARDISED ROOM SERVICES? UP TO ROOM STANDARDS. WE ENSURE END-TO-END CUSTOMER SERVICE BY INVOLVING THE CUSTOMER IN EACH STEP OF THE BOOKING PROCESS.WE PROVIDE ROOMS FOR STUDENTS WITH VERY FLEXIBLE BOOKING POLICIES WHICH ACCOMMODATE THE NEEDS OF A FRESHER IN A NEW CITY.".toLowerCase()
                        ,style: TextStyle(fontFamily: "Nunito"),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("OBJECTIVE",style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("WHILE SHIFTING FROM ONE CITY TO ANOTHER IT IS DIFFICULT TO FIND A ROOM/FLAT/PG FOR ANY INDIVIDUAL, THAT IS BOTH COMFORTABLE AND AFFORDABLE. HERE ROOM WORKS IN THEIR INTEREST AND PROVIDES A BUDGET-FRIENDLY ROOM THAT MEETS THE CORE STANDARDS AND NEEDS OF OUR END CONSUMER. WE AIM TO FULFIL THE BASIC NEEDS OF A FRESHER.WE ALSO PROMOTE THE INTERESTS OF THE ROOM OWNERS. WE BRAND AND POPULARISE THEIR EXISTING FACILITIES AND HELP THEM TO GET BETTER DEALS.".toLowerCase(),
                      style: TextStyle(fontFamily: "Nunito"),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("COMPARISON/SERVICES OFFERED",style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("WE FOCUS ON BOTH ON MAXIMISING THE AVAILABILITY OF BUDGET-FRIENDLY ROOMS AS WELL AS ENHANCING THE   CORE STANDARDS OF THE ROOMS THAT ARE AVAILABLE.WE MEET TO COMFORT- CORNERS OF STUDENTS THROUGH OUR HOSPITALITY ROOM FINDING AND SHIFTING SERVICESOUR CORE SOURCE OF ISN’T LIKE OTHERS CHARGING SHARE OF ROOM RENT BUT WE INCOME BY OUR ROOM AND HOSPITALITY SERVICES WHICH DOESN'T CAUSE HIKE IN RENT LIKE OTHER OPTIONS AVAILABLE.".toLowerCase(),
                      style: TextStyle(fontFamily: "Nunito"),
                    ),
                    Text("OUR SERVICES INCLUDE \n"
                        "• LOCATING A ROOM THAT MEETS YOUR NEEDS AND COMFORT.\n"
                        "• EASY AND FAST BOOKING.\n"
                        "• SHIFTING SERVICES.\n"
                        "• AGREEMENTS.\n"
                        "UNLIKE IN EXISTING RENTING APPS/SERVICES OUR CORE SOURCE OF INCOME COMES FROM OUR ROOM AND HOSPITALITY SERVICES. MOST IMPORTANTLY, OUR CHARGING PATTERNS ENSURE THAT YOUR RENT DOES NOT HIKE UP.".toLowerCase()
                        ,style: TextStyle(fontFamily: "Nunito"),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            SizedBox(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text("Follow Us On:",style: TextStyle(fontSize: 15)),
                    ),
                  ],
                )
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Row(
                children: [
                  TextButton(

                      onPressed: _launchTwitterURL,
                      child: Image.asset("assets/icons/twitter.png",height: 25,)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
