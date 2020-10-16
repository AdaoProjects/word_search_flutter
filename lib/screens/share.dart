import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:findthewords/utilites/colors.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => new _ShareState();
}

class _ShareState extends State<Share> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      backgroundColor: Colors.black,
      key: key,
      body:
      new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              color:GameColors.primary,
              onPressed: (){
                _launchURL("https://github.com/AdaoProjects/word_search_flutter");
              },
              child:Center(child:
                new Text('GitHub',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: MediaQuery. of(context). size. height/15)
                ),
              )
            ),

    ]),
    );

  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}