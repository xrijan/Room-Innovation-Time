import 'package:flutter/material.dart';

import '../Pages/homepage_items/room_work/room_details/UD_DEMO.dart';

class DataSearch extends SearchDelegate<String>{

  final rooms = [
    "Demo Room"
    "UD27000",
    "UD27001",
    "UD27002",
    "UD27003",
  ];

  final recentRooms= [
    "UD27000",
    "UD27003",
  ];



  @override
  List<Widget>? buildActions(BuildContext context) {
    return[IconButton(onPressed: (){
      query = "";
    },
        icon: Icon(Icons.clear))];
  }


  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
        icon: AnimatedIcon(icon : AnimatedIcons.menu_arrow, progress: transitionAnimation,),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return UD_Demo();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ?recentRooms
        :rooms.where((p) => p.startsWith(query)).toList();
    
    return ListView.builder(itemBuilder: (context,index)=> ListTile(
      onTap: (){

         showResults(context);
      },
      leading: Icon(Icons.location_city),
      title: RichText(
        text:TextSpan(
        text: suggestionList[index].substring(0,query.length),
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey),
            )
          ]
      ))),
     itemCount: suggestionList.length,
    );

  }


}



