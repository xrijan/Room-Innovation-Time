import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class RoomsList extends StatefulWidget {
  const RoomsList({Key? key}) : super(key: key);

  @override
  State<RoomsList> createState() => _RoomsListState();
}

class _RoomsListState extends State<RoomsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white70,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const AssetImage("assets/images/rooms/1056541.jpg"),
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 200,
                  fit: BoxFit.cover,
                ),

                 Positioned(right:10, top: 10,
                  child: LikeButton(size: 30),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),

              child:  Text("Deluxe luxury room are Peaceful and spacious, rest among the city.Furnished with a king size....",style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: "Nunito"),),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(onPressed: () {}, child: const Text("Book",style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: "Nunito",fontWeight: FontWeight.bold))),
                TextButton(onPressed: () {}, child: const Text("Share",style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: "Nunito",fontWeight: FontWeight.bold))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
