
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
//
// import 'firebase_services/firebase_storage.dart';
//
//
//
// class testStorage extends StatefulWidget {
//   const testStorage({Key? key}) : super(key: key);
//
//   @override
//   State<testStorage> createState() => _testStorageState();
// }
//
// class _testStorageState extends State<testStorage> {
//   @override
//   Widget build(BuildContext context) {
//
//     final Storage storage = Storage();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Firebase storage test",),
//       ),
//       body:Column(
//         children: [
//           // Center(
//           //     child: ElevatedButton(
//           //       onPressed: ()  async {
//           //         final result = await FilePicker.platform.pickFiles(
//           //           allowMultiple: false,
//           //           type: FileType.custom,
//           //           allowedExtensions: ['png','jpg'],
//           //         );
//           //
//           //         if(result==null){
//           //           ScaffoldMessenger.of(context).showSnackBar(
//           //               SnackBar(
//           //                 content: Text("no fila"),
//           //               )
//           //           );
//           //           return null;
//           //         }
//           //         final path = result.files.single.path!;
//           //         final fileName = result.files.single.name;
//           //
//           //         storage.uploadFile(path,fileName).then((value) => print("Done"));
//           //     },
//           //       child: Text("Upload file"))),
//
//          FutureBuilder(
//            future: storage.downloadURL("demo_anime-room.jpg"),
//              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
//                {
//                  return Container(
//                    child: Image.network(snapshot.data!),
//                  );
//                }
//              if(snapshot.connectionState == ConnectionState.waiting ){
//                return CircularProgressIndicator();
//              }
//              else if(!snapshot.hasData){
//                print("Has no data");
//              }
//              return Container();
//              }
//
//          )
//         ],
//
//       )
//     );
//   }
// }
