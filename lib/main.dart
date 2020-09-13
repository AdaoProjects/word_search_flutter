import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:findthewords/screens/home.dart';
import 'package:findthewords/screens/stats.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        },
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        Locale ('es', ''),
        Locale ('fr', ''),
        Locale ('pt', ''),
        Locale ('en', ''),
      ],
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
}