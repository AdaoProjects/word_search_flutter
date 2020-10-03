import 'package:flutter/material.dart';
import 'package:findthewords/screens/levels.dart';
import 'package:findthewords/screens/stats.dart';
import 'package:findthewords/screens/settings.dart';
import 'package:findthewords/utilites/colors.dart';
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
            Image.asset('assets/images/artecriada.jpg',
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width),
            SizedBox(width:MediaQuery. of(context). size. width/20,
                height: MediaQuery. of(context). size. height/20),

            Icon(Icons.star,
            color: GameColors.secondary,
            size:MediaQuery.of(context).size.height/12),

            SizedBox(width:MediaQuery. of(context). size. width/20,
                height: MediaQuery. of(context). size. height/10),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

                  child:Row(

                children: [
                  Container(
                      child:
                      IconButton(
                        splashRadius: MediaQuery.of(context).size.height/10,
                        splashColor:Colors.yellowAccent,
                        color:GameColors.secondary,
                        icon: Icon(Icons.trending_up),
                        iconSize: MediaQuery.of(context).size.height/10,
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
                  SizedBox(width:MediaQuery.of(context).size.width/20),
                  Container(child:
                  IconButton(
                    splashRadius: MediaQuery.of(context).size.height/10,
                    splashColor:Colors.yellowAccent,
                    color:GameColors.primary,
                    icon: Icon(Icons.play_arrow),
                    iconSize: MediaQuery.of(context).size.height/10,
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
                  SizedBox(width:MediaQuery.of(context).size.width/20),
                  Container(child:
                  IconButton(
                    splashRadius: MediaQuery.of(context).size.height/10,
                    splashColor:Colors.yellowAccent,
                    color:GameColors.secondary,
                    icon: Icon(Icons.share),
                    iconSize: MediaQuery.of(context).size.height/10,
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
                  SizedBox(width:MediaQuery.of(context).size.width/20),
                  Container(child:
                  IconButton(
                    splashRadius: MediaQuery.of(context).size.height/10,
                    splashColor:Colors.yellowAccent,
                    color:GameColors.secondary,
                    icon: Icon(Icons.settings),
                    iconSize: MediaQuery.of(context).size.height/10,
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
                            .height / 10)
                    ),
                  ),




                ],
              )
              )

          ],
        ),
      ),
    );
  }
}