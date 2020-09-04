import 'package:flutter/material.dart';
import 'package:huntersofwords/screens/game_easy.dart';
import 'package:huntersofwords/screens/game_medium.dart';
import 'package:huntersofwords/screens/game_hard.dart';
import 'package:huntersofwords/utilites/colors.dart';
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
                  Image.asset('assets/images/artecriada.jpg',
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 5,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game_Easy()),
                      );
                    } ,
                    color:Colors.black,
                    highlightColor: GameColors.button_Background_Play_Light,
                    child:Ink(
                      decoration:  BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[GameColors.button_Background_Play, Colors.black],),
                        borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                      ),
                      child: Container(
                          constraints:  BoxConstraints(minWidth: MediaQuery. of(context). size. width*4/5, minHeight: MediaQuery. of(context). size. height/15), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: Text('EASY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery. of(context). size. height/15),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                  ),

          SizedBox(width:MediaQuery. of(context). size. width/15,
              height: MediaQuery. of(context). size. height/15),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game_Medium()),
                      );
                    } ,
                    color:Colors.black,
                    highlightColor: GameColors.button_Background_Play_Light,
                    child:Ink(
                      decoration:  BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[GameColors.button_Background_Play, Colors.black],),
                        borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                      ),
                      child: Container(
                          constraints:  BoxConstraints(minWidth: MediaQuery. of(context). size. width*4/5, minHeight: MediaQuery. of(context). size. height/15), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: Text('MEDIUM',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery. of(context). size. height/15),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                  ),

          SizedBox(width:MediaQuery. of(context). size. width/15,
              height: MediaQuery. of(context). size. height/15),

                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game_Hard()),
                      );
                    } ,
                    color:Colors.black,
                    highlightColor: GameColors.button_Background_Play_Light,
                    child:Ink(
                      decoration:  BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[GameColors.button_Background_Play, Colors.black],),
                        borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                      ),
                      child: Container(
                          constraints:  BoxConstraints(minWidth: MediaQuery. of(context). size. width*4/5, minHeight: MediaQuery. of(context). size. height/15), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: Text('HARD',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery. of(context). size. height/15),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                  ),
        ]
            )
        )
    );
  }
}
