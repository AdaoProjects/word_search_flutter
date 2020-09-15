import 'package:flutter/material.dart';
import 'package:findthewords/screens/categories.dart';
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

            SizedBox(width:MediaQuery. of(context). size. width/15,
                height: MediaQuery. of(context). size. height/15),
            Row(
              children:[
                SizedBox(width: MediaQuery.of(context).size.width/5),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 5,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 10,
                  child:
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Level()),
                      );
                    },
                    icon: Icon(Icons.play_arrow,
                        color: Colors.white,
                        size: MediaQuery
                            .of(context)
                            .size
                            .height / 15),
                    highlightColor: Colors.white,
                  ),
                  decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[GameColors.button_Background_Light, Colors.black],),
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/5)),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/5),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 5,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 10,
                  child:
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Stats()),
                      );
                    },
                    icon: Icon(Icons.trending_up,
                        color: Colors.white,
                        size: MediaQuery
                            .of(context)
                            .size
                            .height / 15),
                    highlightColor: Colors.white,
                  ),
                  decoration:  BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[GameColors.button_Background_Light, Colors.black],),
                    borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                  ),
                ),
              ]
            ),


            SizedBox(width:MediaQuery. of(context). size. width/15,
                height: MediaQuery. of(context). size. height/15),

            Row(children:[
              SizedBox(width: MediaQuery.of(context).size.width/5),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 5,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 10,
                child:
                IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  icon: Icon(Icons.thumb_up,
                      color: Colors.white,
                      size: MediaQuery
                          .of(context)
                          .size
                          .height / 15),
                  highlightColor: Colors.white,
                ),
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[GameColors.button_Background_Light, Colors.black],),
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width/5),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 5,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 10,
                child:
                IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  icon: Icon(Icons.settings,
                      color: Colors.white,
                      size: MediaQuery
                          .of(context)
                          .size
                          .height / 15),
                  highlightColor: Colors.white,
                ),
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[GameColors.button_Background_Light, Colors.black],),
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                ),
              )
            ])




          ],

        ),
      ),
    );
  }
}
