import 'package:flutter/material.dart';
import 'package:findthewords/screens/levels.dart';
import 'package:findthewords/screens/stats.dart';
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

            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Level()),
                );
              } ,
              color:Colors.black,
              highlightColor: GameColors.button_Background_Light,
              child:Ink(
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[GameColors.button_Background, Colors.black],),
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                ),
                child: Container(
                    constraints:  BoxConstraints(minWidth: MediaQuery. of(context). size. width*4/5, minHeight: MediaQuery. of(context). size. height/15), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(AppLocalizations.of(context).translate("home_play"),
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
                  MaterialPageRoute(builder: (context) => Level()),
                );
              } ,
              color:Colors.black,
              highlightColor: GameColors.button_Background,
              child:Ink(
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[GameColors.button_Background_Light, Colors.black],),
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                ),
                child: Container(
                    constraints:  BoxConstraints(minWidth: MediaQuery. of(context). size. width*4/5, minHeight: MediaQuery. of(context). size. height/15), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(AppLocalizations.of(context).translate("home_share"),
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
                  MaterialPageRoute(builder: (context) => Stats()),
                );
              } ,
              color:Colors.black,
              highlightColor: GameColors.button_Background,
              child:Ink(
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[GameColors.button_Background_Light, Colors.black],),
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15)),
                ),
                child: Container(
                    constraints:  BoxConstraints(minWidth: MediaQuery. of(context). size. width*4/5, minHeight: MediaQuery. of(context). size. height/15), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(AppLocalizations.of(context).translate("home_stats"),
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
                  MaterialPageRoute(builder: (context) => Level()),
                );
              } ,
              color:Colors.black,
              highlightColor: GameColors.button_Background,
              child:Ink(
                decoration:  BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[GameColors.button_Background_Light, Colors.black],),
                  borderRadius: BorderRadius.all(Radius.circular(MediaQuery. of(context). size. height/15),
                  ),
                ),
                child: Container(
                    constraints:  BoxConstraints(minWidth: MediaQuery. of(context). size. width*4/5, minHeight: MediaQuery. of(context). size. height/15), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(AppLocalizations.of(context).translate("home_settings"),
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
          ],
        ),
      ),
    );
  }
}