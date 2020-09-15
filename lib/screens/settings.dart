
import 'package:findthewords/main.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
          children:[ FlatButton(
        child:Container(
          color:Colors.white,
          height:MediaQuery.of(context).size.height/10,
          width: MediaQuery.of(context).size.width/2,
          child:Text('click')
        ),
        onPressed: ()  {
                MyApp.setLocale(context, Locale('en',''));
        }
      )
    ]
      )
    );
  }
}