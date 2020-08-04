import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Dashboard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  openurl()
  {
    String url1="http://www.etilabs.com/";
    launch(url1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ETI LABS'),
        leading: IconButton(
          icon: Image.asset('assets/etil.jpeg'),
        ),
      ),

//      body:Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: new SingleChildScrollView(
      body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),

            // SizedBox(height: 50.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('About Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 25.0))

            ),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('The mission of ETI Labs is to minimize the gap between theoretical and practical education in engineering institutions by providing a wide range of integrated materials '
                    'which includes Theory practical and real-life projects towards developing innovative skills in your mind.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        //   fontWeight: FontWeight.bold,

                        fontSize: 20.0))

            ),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('Industry',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 25.0))

            ),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('We provide services to the industry for making their existing product/'
                    'machines smarter by enhancing their functionality '
                    'using the Internet of Things & AI, thereby increasing their productivity and reducing downtime.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        //   fontWeight: FontWeight.bold,

                        fontSize: 20.0))

            ),
            SizedBox(height: 15.0),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('Education',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 25.0))

            ),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('We provide wide range of educational kits with affordable prices. We also provide a perfect blend of trainings,'
                    ' as well as real-life industry experience to the students which grooms them to be Industry 4.0 ready.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        //  fontWeight: FontWeight.bold,

                        fontSize: 20.0))
            ),

            SizedBox(height: 15.0),
            SizedBox(height: 15.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('Products',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 25.0))

              //    margin:EdgeInsets.all(40.0),
//              decoration: BoxDecoration(
//                shape: BoxShape.circle,
//                color:Colors.blue,
//              ),
            ),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('EMBEDDED SYSTEM DEVELOPMENT BOARD (8051)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 25.0)
                )

            ),

            Container(
              child:Image.asset(

                'assets/ed.jpeg',
                //  width: 250,
                //height: 250,
                fit: BoxFit.contain,
              ),

            ),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('The Embedded System Development Board (8051) represents the embedded system consisting'
                    ' of the hardware and the software embedded in it. It is based on microcontroller and is design to carry out specific computations in the embedded system.'
                    ' The microcontroller 8051 is designed by the Intel MOS-51.'
                    ' An Embedded system consists of processor, memory, power supply with the external interfaces which plug in on a card. It is smaller in the size and faster to load.',
                    //textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,

                        fontSize: 20.0))

            ),
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('BEST IOT DEVELOPMENT BOARD (ESP12E) – WIFI MODULE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 25.0)
                )

            ),

            Container(
                child:Image(
                  image: AssetImage('assets/iot.jpeg'),
                )
            ),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text(' IoT Development Board (ESP12E)  is the best development of mobile phones and embedded applications that are being connected'
                    'to the internet to integrate great computing capabilities and using data analytics to extract meaningful information.'

                    'IoT boards are known as development boards or prototyping boards, are hardware platforms that are commonly used to build prototypes of the manufacturer’s ideas.',
                    //textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,

                        fontSize: 20.0))

            ),
            SizedBox(height: 25.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('TRAININGS/WORKSHOPS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 25.0)
                )

            ),
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),
            Container(
                child:Image.asset(
                  //   image: AssetImage('assets/train.jpeg'),
                  'assets/train.jpeg',
                  width: 250,
                  height: 250,
                )
            ),
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('Various industrial iot courses are offered by ETI Labs. To know about procedure and various courses click the below button.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,

                        fontSize: 20.0))

            ),
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: Text('INDUSTRIAL IOT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,

                        fontSize: 25.0))

            ),
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),

            Container(
                child:Image.asset(

                  'assets/industry.jpeg',
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                )
            ),
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),
            Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Text('Various industrial iot courses are offered by ETI Labs. To know about procedure and various courses click the below button.',
                    //    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        //fontWeight: FontWeight.bold,

                        fontSize: 20.0))

            ),
//    Container(
//    width: 1.0,
//    //height: 75.0,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(

                  //] child:RaisedButton(
                  child: const Text('Know More',
                  ),

                  onPressed: () {
                    openurl();
                  },

                  padding: const EdgeInsets.symmetric(vertical:10.0,horizontal:5.0),

                  color:  Color(0xFF42A5F5),
                ),
              ],
            ),
//    RaisedButton(


          ]
      ),

    );
  }
}
