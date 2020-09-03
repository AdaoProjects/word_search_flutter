import 'package:flutter/material.dart';
import 'package:huntersofwords/screens/home.dart';
import 'package:huntersofwords/screens/game_easy.dart';
import 'package:huntersofwords/screens/game_medium.dart';
import 'package:huntersofwords/screens/game_hard.dart';
class Level extends StatefulWidget {
  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('LEVELS',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: MediaQuery. of(context). size. height/15)
            ),
          SizedBox(width:MediaQuery. of(context). size. width/10,
              height: MediaQuery. of(context). size. height/10),

          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MediaQuery. of(context). size. height/30),
                  side: BorderSide(color: Colors.blue[700])),
              onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Game_Easy()),
              ); },
              color:Colors.blue,
              highlightColor: Colors.blue[700],
              elevation: MediaQuery. of(context). size. height/50,
              highlightElevation: MediaQuery. of(context). size. height/30,
              child:Text('EASY',
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
                  side: BorderSide(color: Colors.blue[700])),
              onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Game_Medium()),
              );},
              color:Colors.blue,
              highlightColor: Colors.blue[700],
              elevation: MediaQuery. of(context). size. height/50,
              highlightElevation: MediaQuery. of(context). size. height/30,
              child:Text('MEDIUM',
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
                  side: BorderSide(color: Colors.blue[700])),
              onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Game_Hard()),
              );},
              color:Colors.blue,
              highlightColor: Colors.blue[700],
              elevation: MediaQuery. of(context). size. height/50,
              highlightElevation: MediaQuery. of(context). size. height/30,
              child:Text('HARD',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: MediaQuery. of(context). size. height/15))
          ),
        ]
            )
        )
    );
  }
}
