import 'package:findthewords/utilites/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:findthewords/main.dart';
import 'package:flutter/material.dart';
import 'package:findthewords/app_localizations.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  Language _selectedLanguage;
  bool checkValue=false;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        Scaffold(
            backgroundColor: Colors.black,
            body:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[ SizedBox(height:MediaQuery.of(context).size.height/5),

                  Text(AppLocalizations.of(context).translate("settings_settings"),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: MediaQuery. of(context). size. width/12)
                  ),

                  SizedBox(height:MediaQuery.of(context).size.height/20),

                  Column(

                      children:[
                    Row(children:[
                      SizedBox(width:MediaQuery.of(context).size. width/3),
                      Text(AppLocalizations.of(context).translate("settings_sound"),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: MediaQuery. of(context). size. height/20)
                      ),
                      Theme(
data: ThemeData(unselectedWidgetColor: Colors.blue),
child: Checkbox(
                        hoverColor: Colors.white,
                        activeColor: Colors.white,
                        checkColor: GameColors.primary,
                        value:checkValue,
                        onChanged: (bool newValue)async{
                          setState(() {
                            checkValue=newValue;
                          });
                          if(checkValue==false){
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool('has_Sounds', false);
                            Navigator.of(context).pushNamed("/game_easy");
                            Navigator.of(context).pushNamed("/game_medium");
                            Navigator.of(context).pushNamed("/game_hard");
                          }else{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setBool('has_Sounds', false);
                            Navigator.of(context).pushNamed("/game_easy");
                            Navigator.of(context).pushNamed("/game_medium");
                            Navigator.of(context).pushNamed("/game_hard");
                          }
                        },
                      ),
                      ),

                    ]
                    ),

                    SizedBox(height:MediaQuery.of(context).size.height/25),

                    DropdownButton(
                      iconSize:MediaQuery. of(context). size. height/10 ,
                      dropdownColor: Colors.white,
                      underline: Text(AppLocalizations.of(context).translate("settings_language"),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: MediaQuery. of(context). size. height/20)
                      ),
                      items: Language.getLanguages().map((Language lang) {
                        return DropdownMenuItem<Language>(
                          value: lang,
                          child: Text(lang.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: MediaQuery. of(context). size. height/20)
                          ),
                        );
                      }).toList(),

                      onChanged: (Language val) {
                        _selectedLanguage = val;
                        MyApp.setLocale(context, Locale(val.languageCode,''));
                      },
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height/25),
                    Text(AppLocalizations.of(context).translate("settings_theme"),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: MediaQuery. of(context). size. height/20)
                    ),
                  ]
                  )

          ]





            )
        )
    );
  }
}
class Language {
  final int id;
  final String name;
  final String languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> getLanguages() {
    return <Language>[
      Language(1, 'English', 'en'),
      Language(2, 'Português', 'pt'),
      Language(3, 'Français', 'fr'),
      Language(4, 'Español', 'es'),
    ];
  }
}