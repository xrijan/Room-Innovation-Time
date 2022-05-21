import 'package:flutter/material.dart';


class ExploreUdaipur extends StatefulWidget {
  const ExploreUdaipur({Key? key}) : super(key: key);

  @override
  State<ExploreUdaipur> createState() => _ExploreUdaipurState();
}

class _ExploreUdaipurState extends State<ExploreUdaipur> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    List<Widget> reel = [
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
              children: [
                Image.asset('assets/images/udaipur/citypalace.jpg'),
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
      ),
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:  Stack(
              children: [
                Image.asset('assets/images/udaipur/My project.png'),
                const Positioned.fill(
                    child: Align(
                      alignment: Alignment(-0.89,0.99),

                      child: Padding(
                        padding: EdgeInsets.all(8.0),

                        child: Text(' LAKE PICHOLA\n'
                            '\n'
                            'Lake Pichola, situated in Udaipur city in the Indian state of Rajasthan, is an artificial fresh water lake, created in the year 1362, named after the nearby Picholi village. It is one of the several contiguous lakes, and developed over the last few centuries in and around the famous Udaipur city.',
                            style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ))
              ]
          )
      ),
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:  Stack(
              children: [
                Image.asset('assets/images/udaipur/monsoonon.png'
                    ''),
                const Positioned.fill(
                    child: Align(
                      alignment: Alignment(-0.89,0.99),

                      child: Padding(
                        padding: EdgeInsets.all(8.0),

                        child: Text(' MONSOON PALACE\n'
                            '\n'
                            'The Monsoon Palace, also known as the Sajjan Garh Palace, is a hilltop palatial residence in the city of Udaipur, Rajasthan in India, overlooking the Fateh Sagar Lake. It is named Sajjangarh after Maharana Sajjan Singh of the Mewar Dynasty, who it was built for in 1884.',
                            style: TextStyle(color: Colors.black, fontSize: 17, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ))
              ]
          )
      ),
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:  Stack(
              children: [
                Image.asset('assets/images/udaipur/haveli.png'),
                const Positioned.fill(
                    child: Align(
                      alignment: Alignment(-0.89,0.96),

                      child: Padding(
                        padding: EdgeInsets.all(8.0),

                        child: Text(' BAGORE KI HAVELI\n'
                            '\n'
                            'Bagore-ki-Haveli is a haveli in Udaipur in Rajasthan state in India. It is right on the waterfront of Lake Pichola at Gangori Ghat. Amar Chand Badwa, the Prime Minister of Mewar, built it in the eighteenth century.', 
                            style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ))
              ]
          )
      ),
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:  Stack(
              children: [
                Image.asset('assets/images/udaipur/jag mandir.png'),
                const Positioned.fill(
                    child: Align(
                      alignment: Alignment(-0.89,1),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(' JAG MANDIR\n'
                            '\n'
                            'Jag Mandir is a palace built on an island in the Lake Pichola. It is also called the "Lake Garden Palace". The palace is located in Udaipur city in the Indian state of Rajasthan. Its construction is credited to three Maharanas of the Sisodia Rajputs of Mewar kingdom', 
                            style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: 'Nunito', fontStyle: FontStyle.normal, fontWeight: FontWeight.bold)
                        ),
                      ),
                    ))
              ]
          )
      ),
    ];
    return Scaffold(
      body: Container(
        child: SafeArea(
          top: true,
          bottom: true,
          left: false,
          right: false,
          maintainBottomViewPadding: true,
          minimum: EdgeInsets.all(8.0),
          child: PageView(
            scrollDirection: Axis.vertical,
            children: reel,
            controller: controller,
          ),
        ),
      ),
    );
  }
}
