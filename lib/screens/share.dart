import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:findthewords/utilites/colors.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => new _ShareState();
}

class _ShareState extends State<Share> with TickerProviderStateMixin {
  String _copy = "Copy Me";

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
            Text("Click to copy",
                style: TextStyle(
                    color: GameColors.secondary,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: MediaQuery. of(context). size. height/20)),
            SizedBox(height:MediaQuery.of(context).size.height/15),
            new GestureDetector(
              child:Container(
                color: Colors.white,
                child:CustomToolTip(
                  text: "https://github.com/AdaoProjects/word_search_flutter"
              ),
              ),
              onTap: () {

              },
            ),

    ]),
    );
  }
}

class CustomToolTip extends StatelessWidget {

  String text;

  CustomToolTip({this.text});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Tooltip(preferBelow: false,
          message: "Copy", child: new Text(text)),
      onTap: () {
        Clipboard.setData(new ClipboardData(text: text));
      },
    );
  }
}