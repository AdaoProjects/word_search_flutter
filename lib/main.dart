import 'package:findthewords/screens/game_easy.dart';
import 'package:findthewords/screens/game_hard.dart';
import 'package:findthewords/screens/game_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:findthewords/screens/home.dart';
import 'package:findthewords/screens/stats.dart';
import 'app_localizations.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyApp(),
        routes: <String, WidgetBuilder>{
          "/stats" : (BuildContext context)=> new Stats(),
          "/game_easy" : (BuildContext context) => new Game_Easy(),
          "/game_medium" : (BuildContext context) => new Game_Medium(),
          "/game_hard" : (BuildContext context) => new Game_Hard(),
        },

    ));
  });

}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState state =
    context.findAncestorStateOfType<_MyAppState>();
    state.changeLanguage(newLocale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Locale _locale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale ('en', ''),
        Locale ('es', ''),
        Locale ('fr', ''),
        Locale ('pt', ''),
      ],
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: Home(),
    );
  }
  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
}