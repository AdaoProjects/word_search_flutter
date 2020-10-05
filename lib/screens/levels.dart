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
                  Image.asset('assets/images/find_the_words_adan.png',
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 5,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width),
                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width / 10,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 15),
                  Text(AppLocalizations.of(context).translate("levels_food"),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 15)
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child:Row(

                        children: [
                          Container(
                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_easy"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Easy(game_type: new Game_Type("food")
                                      )));
                                },
                              )
                          ),
                          Container(
                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_medium"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Medium(game_type: new Game_Type("food")
                                      )));
                                },
                              )
                          ),
                          Container(

                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_hard"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Hard(game_type: new Game_Type("food")
                                      )));
                                },
                              )
                          ),
                        ]
                    ),

                  ),
                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width / 10,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 15),
                  Text(AppLocalizations.of(context).translate("levels_animals"),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 15)
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child:Row(

                        children: [
                          Container(
                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_easy"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Easy(game_type: new Game_Type("animals")
                                      )));
                                },
                              )
                          ),
                          Container(
                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_medium"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Medium(game_type: new Game_Type("animals")
                                      )));
                                },
                              )
                          ),
                          Container(
                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_hard"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Hard(game_type: new Game_Type("animals")
                                      )));
                                },
                              )
                          ),
                        ]
                    ),

                  ),
                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width / 10,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 15),
                  Text(AppLocalizations.of(context).translate("levels_diverse"),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 15)
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child:Row(

                        children: [
                          Container(
                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_easy"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Easy(game_type: new Game_Type("diverse")
                                      )));
                                },
                              )
                          ),
                          Container(
                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_medium"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Medium(game_type: new Game_Type("diverse")
                                      )));
                                },
                              )
                          ),
                          Container(
                              child:FlatButton(
                                child: Text(AppLocalizations.of(context).translate("levels_hard"),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 25)
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Game_Hard(game_type: new Game_Type("diverse")
                                      )));
                                },
                              )
                          ),
                        ]
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