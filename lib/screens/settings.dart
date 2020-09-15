
import 'package:findthewords/main.dart';
import 'package:flutter/material.dart';
import 'package:findthewords/app_localizations.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  Language _selectedLanguage;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
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
                      fontSize: MediaQuery. of(context). size. height/15)
              ),

              SizedBox(height:MediaQuery.of(context).size.height/15),

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
              SizedBox(height:MediaQuery.of(context).size.height/5),

              CheckboxListTile(
                title: Text(AppLocalizations.of(context).translate("settings_sound"),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: MediaQuery. of(context). size. height/20)
                ),
                value: true,
                onChanged: (newValue) { },

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