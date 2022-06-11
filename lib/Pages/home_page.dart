import 'package:dev_rijan_room_it/Pages/homepage_items/room_work/room_list.dart';
import 'package:flutter/material.dart';
import 'homepage_items/App_Bar/Custom_AppBar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 10, 0, 0),
                    child: Text("Recommended",style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "Nunito")),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            RoomsList(),
            SizedBox(height: 10),
            SizedBox(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 10, 0, 0),
                    child: Text("We are out of Rooms",style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "Nunito")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
