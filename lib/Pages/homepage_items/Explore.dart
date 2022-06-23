import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../firebase_services/firebase_storage.dart';


class ExploreUdaipur extends StatefulWidget {
  const ExploreUdaipur({Key? key}) : super(key: key);

  @override
  State<ExploreUdaipur> createState() => _ExploreUdaipurState();
}

class _ExploreUdaipurState extends State<ExploreUdaipur> {
  @override
  Widget build(BuildContext context) {

    final Storage storage = Storage();
    PageController controller = PageController(initialPage: 0);
    List<Widget> reel = [
      SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: FutureBuilder(
            future: storage.downloadURL("Explore","citypalace.jpg"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {


            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
               {
                 return Container(
                     height: MediaQuery.of(context).size.height,
                     width: MediaQuery.of(context).size.width,
                     color: Colors.white,
                     child: Stack(
                         children: [
                           // Image.asset('assets/images/udaipur/citypalace.jpg'),
                           Image.network(snapshot.data!),
                           const Positioned.fill(
                               child: Align(
                                 alignment: Alignment(-0.89,0.93),


                                 child: Padding(
                                   padding: EdgeInsets.all(8.0),

                                   child: Text('CITY PALACE\n'
                                       '\n'
                                       'City Palace, Udaipur is a palace complex situated in the city of Udaipur in the Indian state of Rajasthan. It was built over a period of nearly 400 years, with contributions from several rulers of the Mewar dynasty',
                                       style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                                   ),
                                 ),
                               ))
                         ]
                     )
                 );
               }
             if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData ){
               return Center(
                   child: SpinKitFadingFour(
                        size: 40,
                     color: Colors.black,

                       )
               );
             }
            return Container();
          }
        ),
      ),

      SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: FutureBuilder(
            future: storage.downloadURL("Explore","My project.png"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot)  {
              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
              {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child:  Stack(
                        children: [
                          Image.network(snapshot.data!),
                          const Positioned.fill(
                              child: Align(
                                alignment: Alignment(-0.89,0.99),


                                child: Padding(
                                  padding: EdgeInsets.all(8.0),

                                  child: Text(' LAKE PICHOLA\n'
                                      '\n'
                                      'Lake Pichola, situated in Udaipur city in the Indian state of Rajasthan, is an artificial fresh water lake, created in the year 1362, named after the nearby Picholi village.',
                                      style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                                  ),
                                ),
                              ))
                        ]
                    )
                );
              }
              if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData ){
                return Center(
                    child: SpinKitFadingFour(
                      size: 40,
                      color: Colors.black,

                    )
                );
              }
            return Container();
          }
        ),
      ),

      FutureBuilder(
          future: storage.downloadURL("Explore","monsoonon.png"),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {


            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
            {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child:  Stack(
                      children: [
                        Image.network(snapshot.data!),
                        const Positioned.fill(
                            child: Align(
                              alignment: Alignment(-0.89,0.99),

                              child: Padding(
                                padding: EdgeInsets.all(8.0),

                                child: Text(' MONSOON PALACE\n'

                                    'The Monsoon Palace, also known as the Sajjan Garh Palace, is a hilltop palatial residence in the city of Udaipur, Rajasthan in India.',
                                    style: TextStyle(color: Colors.black, fontSize: 17, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                                ),
                              ),
                            ))
                      ]
                  )
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData ){
              return Center(
                  child: SpinKitFadingFour(
                    size: 40,
                    color: Colors.black,

                  )
              );
            }
            return Container();
          }
      ),


      FutureBuilder(
          future: storage.downloadURL("Explore","haveli.png"),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot)  {
            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
            {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child:  Stack(
                      children: [
                        Image.network(snapshot.data!),
                        const Positioned.fill(
                            child: Align(
                              alignment: Alignment(-0.89,0.96),

                              child: Padding(
                                padding: EdgeInsets.all(8.0),

                                child: Text(' BAGORE KI HAVELI\n'
                                    '\n'
                                    'Bagore-ki-Haveli is a haveli in Udaipur in Rajasthan state in India.',
                                    style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                                ),
                              ),
                            ))
                      ]
                  )
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData ){
              return Center(
                  child: SpinKitFadingFour(
                    size: 40,
                    color: Colors.black,

                  )
              );
            }
            return Container();
          }
      ),



      FutureBuilder(
          future: storage.downloadURL("Explore","jag mandir.png"),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot)  {
            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
            {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child:  Stack(
                      children: [
                          Image.network(snapshot.data!),
                        const Positioned.fill(
                            child: Align(
                              alignment: Alignment(-0.89,1),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(' JAG MANDIR\n'
                                    'Jag Mandir is a palace built on an island in the Lake Pichola. It is also called the "Lake Garden Palace". The palace is located in Udaipur city in the Indian state of Rajasthan.',
                                    style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                                ),
                              ),
                            ))
                      ]
                  )
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData ){
              return Center(
                  child: SpinKitFadingFour(
                    size: 40,
                    color: Colors.black,

                  )
              );
            }
            return Container();
          }
      ),
    ];
    return Scaffold(
      body: Container(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: reel,
          controller: controller,
        ),
      ),
    );
  }
}
