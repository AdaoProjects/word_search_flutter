import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huntersofwords/screens/home.dart';
import 'package:huntersofwords/screens/stats.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyApp(),
        routes: <String, WidgetBuilder>{
          "/stats" : (BuildContext context)=> new Stats(),
        }
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),

    );
  }
}