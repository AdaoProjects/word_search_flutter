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
                  Image.asset('assets/images/artecriada.jpg',
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 5,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width),
                  Text(AppLocalizations.of(context).translate("levels_level"),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 15)
                  ),
                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width / 10,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 10),

                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Game_Easy(game_type: new Game_Type("food")
                          )));
                    },
                    color: Colors.black,
                    highlightColor: GameColors.tertiary,
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            GameColors.primary,
                            Colors.black
                          ],),
                        borderRadius: BorderRadius.all(
                            Radius.circular(MediaQuery
                                .of(context)
                                .size
                                .height / 15)),
                      ),
                      child: Container(
                          constraints: BoxConstraints(minWidth: MediaQuery
                              .of(context)
                              .size
                              .width * 4 / 5, minHeight: MediaQuery
                              .of(context)
                              .size
                              .height / 15), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: Text(AppLocalizations.of(context).translate(
                              "levels_easy"),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 15),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                  ),

                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width / 15,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 15),
                  RaisedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game_Medium(game_type: new Game_Type("food"))),
                      );
                    },
                    color: Colors.black,
                    highlightColor: GameColors.tertiary,
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            GameColors.primary,
                            Colors.black
                          ],),
                        borderRadius: BorderRadius.all(
                            Radius.circular(MediaQuery
                                .of(context)
                                .size
                                .height / 15)),
                      ),
                      child: Container(
                          constraints: BoxConstraints(minWidth: MediaQuery
                              .of(context)
                              .size
                              .width * 4 / 5, minHeight: MediaQuery
                              .of(context)
                              .size
                              .height / 15), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: Text(AppLocalizations.of(context).translate(
                              "levels_medium"),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 15),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                  ),

                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width / 15,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 15),

                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game_Hard(game_type: new Game_Type("food"))),
                      );
                    },
                    color: Colors.black,
                    highlightColor: GameColors.tertiary,
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            GameColors.primary,
                            Colors.black
                          ],),
                        borderRadius: BorderRadius.all(
                            Radius.circular(MediaQuery
                                .of(context)
                                .size
                                .height / 15)),
                      ),
                      child: Container(
                          constraints: BoxConstraints(minWidth: MediaQuery
                              .of(context)
                              .size
                              .width * 4 / 5, minHeight: MediaQuery
                              .of(context)
                              .size
                              .height / 15), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: Text(AppLocalizations.of(context).translate(
                              "levels_hard"),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 15),
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
class Game_Type{
  String type;
  Game_Type(this.type);
}
