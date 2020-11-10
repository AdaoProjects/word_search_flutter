import 'package:flutter/material.dart';
import 'dart:async';
import 'package:findthewords/screens/levels.dart';
import 'package:findthewords/screens/stats.dart';
import 'package:findthewords/screens/settings.dart';
import 'package:findthewords/utilites/colors.dart';
import 'package:findthewords/screens/share.dart';
import 'package:findthewords/app_localizations.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  double opacity = 1.0;
  double opacity_once = 0.3;

@override
void initState() {
  super.initState();
  changeOpacity();
}

changeOpacity() {
  Future.delayed(Duration(seconds: 3), () {
    setState(() {
      opacity = opacity == 0.3 ? 1.0 : 0.3;
      changeOpacity();
    opacity_once=1.0;
    });
  
  });
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             AnimatedOpacity(
        opacity: opacity_once,
        duration: Duration(milliseconds: 250),
        child:AppLocalizations.of(context).translate("game_language")=="en"? Image.asset('assets/images/find_the_words_adan.png',
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
                    .width) :AppLocalizations.of(context).translate("game_language")=="fr"?Image.asset('assets/images/img_ftw_fr.png',
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width) :AppLocalizations.of(context).translate("game_language")=="es"?Image.asset('assets/images/img_ftw_es.png',
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width) :
            Image.asset('assets/images/find_the_words_adan.png',
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width),
             ),
            SizedBox(width:MediaQuery. of(context). size. width/20,
                height: MediaQuery. of(context). size. height/15),
            
             Row(children:[
              SizedBox(width:MediaQuery.of(context).size.width/5),
                AnimatedOpacity(
        opacity: opacity == 1 ? 1.0 : 0.3,
        duration: Duration(seconds: 3),
        child: Icon(Icons.star,
                  color: GameColors.secondary,
                  size:MediaQuery.of(context).size.width/10),
                ),
            
              SizedBox(width:MediaQuery.of(context).size.width/10),
                AnimatedOpacity(
        opacity: opacity == 1 ? 0.3 : 1,
        duration: Duration(seconds: 3),
        child:  Icon(Icons.star,
                  color: GameColors.secondary,
                  size:MediaQuery.of(context).size.width/5),
              ),
              SizedBox(width:MediaQuery.of(context).size.width/10),
                AnimatedOpacity(
        opacity: opacity == 1 ? 1.0 : 0.3,
        duration: Duration(seconds: 3),
        child: Icon(Icons.star,
                  color: GameColors.secondary,
                  size:MediaQuery.of(context).size.width/10),
                ),

            ]),
      
               


            SizedBox(width:MediaQuery. of(context). size. width/20,
                height: MediaQuery. of(context). size. height/10),


            AnimatedOpacity(
        opacity: opacity_once,
        duration: Duration(milliseconds: 250),
        child:  SingleChildScrollView(
              scrollDirection: Axis.horizontal,

                  child:Row(

                children: [
                  SizedBox(width:MediaQuery.of(context).size.width/25),
                  Container(child:
                  IconButton(
                    splashRadius: MediaQuery.of(context).size.width/9,
                    splashColor:Colors.yellowAccent,
                    highlightColor: Colors.yellowAccent,
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
                        splashRadius: MediaQuery.of(context).size.width/9,
                        splashColor:Colors.yellowAccent,
                        highlightColor: Colors.yellowAccent,
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
            ),
              SizedBox(height:MediaQuery.of(context).size.height/15),
             
             AnimatedOpacity(
        opacity: opacity_once,
        duration: Duration(milliseconds: 250),
        child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                child:
              Row(children:[
                SizedBox(width:MediaQuery.of(context).size.width/25),
                Container(child:
                IconButton(
                  splashRadius: MediaQuery.of(context).size.width/9,
                  splashColor:Colors.yellowAccent,
                  highlightColor: Colors.yellowAccent,
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
                SizedBox(width:MediaQuery.of(context).size.width/9),
                Container(child:
                IconButton(
                  splashRadius: MediaQuery.of(context).size.width/9,
                  splashColor:Colors.yellowAccent,
                  highlightColor: Colors.yellowAccent,
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
             )

          ],
        ),
      ),
    );
    
  }
  
}


