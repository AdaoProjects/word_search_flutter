import 'package:flutter/material.dart';
import 'package:findthewords/screens/game_easy.dart';
import 'package:findthewords/screens/game_medium.dart';
import 'package:findthewords/screens/game_hard.dart';
import 'package:findthewords/utilites/colors.dart';
import 'package:findthewords/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width / 10,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 15),


                  Column(
                    children:[
                      FlatButton(
                      color: GameColors.primary,
                        highlightColor: Colors.yellowAccent,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Game_Easy(
                              )));
                        },
                        child: Text(AppLocalizations.of(context).translate("levels_easy"),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 15)
                        ),
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                      ),
                      SizedBox(width: MediaQuery
                          .of(context)
                          .size
                          .width / 10,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 20),
                      FlatButton(
                        color: GameColors.primary,
                        highlightColor: Colors.yellowAccent,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Game_Medium(
                              )));
                        },
                        child: Text(AppLocalizations.of(context).translate("levels_medium"),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 15)
                        ),
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                      ),
                      SizedBox(width: MediaQuery
                          .of(context)
                          .size
                          .width / 10,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 20),
                      FlatButton(
                        color: GameColors.primary,
                        highlightColor: Colors.yellowAccent,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Game_Hard(
                              )));
                        },
                        child: Text(AppLocalizations.of(context).translate("levels_hard"),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 15)
                        ),
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                      ),
                    ]
                  ),
                ]
            )
        )
    );
  }
}
