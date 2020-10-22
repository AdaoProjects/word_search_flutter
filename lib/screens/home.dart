import 'package:flutter/material.dart';
import 'package:findthewords/screens/levels.dart';
import 'package:findthewords/screens/stats.dart';
import 'package:findthewords/screens/settings.dart';
import 'package:findthewords/utilites/colors.dart';
import 'package:findthewords/screens/share.dart';
import 'package:findthewords/app_localizations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppLocalizations.of(context).translate("game_language")=="en"? Image.asset('assets/images/find_the_words_adan.png',
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width) :AppLocalizations.of(context).translate("game_language")=="pt"?Image.asset('assets/images/img_ftw_pt.png',
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width) :Image.asset('assets/images/find_the_words_adan.png',
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width),
            SizedBox(width:MediaQuery. of(context). size. width/20,
                height: MediaQuery. of(context). size. height/15),

            Row(children:[
              SizedBox(width:MediaQuery.of(context).size.width/5),
              Icon(Icons.star,
                  color: GameColors.secondary,
                  size:MediaQuery.of(context).size.width/10),
              SizedBox(width:MediaQuery.of(context).size.width/10),
              Icon(Icons.star,
                  color: GameColors.secondary,
                  size:MediaQuery.of(context).size.width/5),
              SizedBox(width:MediaQuery.of(context).size.width/10),
              Icon(Icons.star,
                  color: GameColors.secondary,
                  size:MediaQuery.of(context).size.width/10),
            ]),


            SizedBox(width:MediaQuery. of(context). size. width/20,
                height: MediaQuery. of(context). size. height/10),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

                  child:Row(

                children: [
                  SizedBox(width:MediaQuery.of(context).size.width/25),
                  Container(child:
                  IconButton(
                    splashRadius: MediaQuery.of(context).size.width/7,
                    splashColor:Colors.yellowAccent,
                    color:GameColors.primary,
                    icon: Icon(Icons.play_arrow),
                    iconSize: MediaQuery.of(context).size.width/7,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Level()),
                      );
                    },
                  ),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(MediaQuery
                            .of(context)
                            .size
                            .height / 10)
                    ),
                  ),
                  SizedBox(width:MediaQuery.of(context).size.width/10),
                  Container(
                      child:
                      IconButton(
                        splashRadius: MediaQuery.of(context).size.width/7,
                        splashColor:Colors.yellowAccent,
                        color:GameColors.secondary,
                        icon: Icon(Icons.trending_up),
                        iconSize: MediaQuery.of(context).size.width/7,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Stats()),
                          );
                        },
                      ),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(MediaQuery
                            .of(context)
                            .size
                            .height / 10)
                    ),
                  ),

                ],
              ),
            ),
              SizedBox(height:MediaQuery.of(context).size.height/15),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                child:
              Row(children:[
                SizedBox(width:MediaQuery.of(context).size.width/25),
                Container(child:
                IconButton(
                  splashRadius: MediaQuery.of(context).size.width/7,
                  splashColor:Colors.yellowAccent,
                  color:GameColors.secondary,
                  icon: Icon(Icons.share),
                  iconSize: MediaQuery.of(context).size.width/7,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Share()),
                    );
                  },
                ),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(MediaQuery
                          .of(context)
                          .size
                          .height / 10)
                  ),
                ),
                SizedBox(width:MediaQuery.of(context).size.width/10),
                Container(child:
                IconButton(
                  splashRadius: MediaQuery.of(context).size.width/7,
                  splashColor:Colors.yellowAccent,
                  color:GameColors.secondary,
                  icon: Icon(Icons.settings),
                  iconSize: MediaQuery.of(context).size.width/7,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                ),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(MediaQuery
                          .of(context)
                          .size
                          .width/7)
                  ),
                ),
              ]
              )
              )

          ],
        ),
      ),
    );
  }
}