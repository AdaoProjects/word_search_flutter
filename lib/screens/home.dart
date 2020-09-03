import 'package:flutter/material.dart';
import 'package:huntersofwords/screens/levels.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var firstColor = Colors.red[300], secondColor = Colors.red[700];
  //width=  MediaQuery. of(context). size. width;
  //heigth = MediaQuery. of(context). size. height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HUNTERS',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: MediaQuery. of(context). size. height/12)
            ),
            SizedBox(width:MediaQuery. of(context). size. width/10,
            height: MediaQuery. of(context). size. height/10),

            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery. of(context). size. height/30),
                    side: BorderSide(color: Colors.red[700])),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Level()),
                );
              } ,
                color:Colors.red,
                highlightColor: Colors.red[700],
                elevation: MediaQuery. of(context). size. height/50,
                highlightElevation: MediaQuery. of(context). size. height/30,
                child:Text('PLAY',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: MediaQuery. of(context). size. height/15))
            ),

            SizedBox(width:MediaQuery. of(context). size. width/15,
                height: MediaQuery. of(context). size. height/15),

            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery. of(context). size. height/30),
                    side: BorderSide(color: Colors.red[700])),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level()),
                  );
                } ,
                color:Colors.red,
                highlightColor: Colors.red[700],
                elevation: MediaQuery. of(context). size. height/50,
                highlightElevation: MediaQuery. of(context). size. height/30,
                child:Text('CHALLENGE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: MediaQuery. of(context). size. height/15))
            ),

            SizedBox(width:MediaQuery. of(context). size. width/15,
                height: MediaQuery. of(context). size. height/15),

            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery. of(context). size. height/30),
                    side: BorderSide(color: Colors.red[700])),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level()),
                  );
                } ,
                color:Colors.red,
                highlightColor: Colors.red[700],
                elevation: MediaQuery. of(context). size. height/50,
                highlightElevation: MediaQuery. of(context). size. height/30,
                child:Text('STATS',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: MediaQuery. of(context). size. height/15))
            ),
            SizedBox(width:MediaQuery. of(context). size. width/15,
                height: MediaQuery. of(context). size. height/15),

            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery. of(context). size. height/30),
                    side: BorderSide(color: Colors.red[700])),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Level()),
                  );
                } ,
                color:Colors.red,
                highlightColor: Colors.red[700],
                elevation: MediaQuery. of(context). size. height/50,
                highlightElevation: MediaQuery. of(context). size. height/30,
                child:Text('SETTINGS',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: MediaQuery. of(context). size. height/15))
            ),
          ],
        ),
      ),
    );
  }
}
