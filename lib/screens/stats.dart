import 'package:flutter/material.dart';
import 'package:findthewords/utilites/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:findthewords/app_localizations.dart';
class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}
class _StatsState extends State<Stats> {
  String best_time_easy='';
  String best_time_medium='';
  String best_time_hard='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child:Column(children:[
              SizedBox(height:MediaQuery.of(context).size.height/5),
              Text(AppLocalizations.of(context).translate("stats_results"),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: MediaQuery. of(context). size. height/15)
              ),
              SizedBox(height: MediaQuery.of(context).size.height/10),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 7 / 10,
                child:Column(
                children: [
                      Text(AppLocalizations.of(context).translate("stats_easy")+'  '+ get_best_time_easy(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery. of(context). size. height/20)
                      ),
                  SizedBox(height:MediaQuery. of(context). size. height/30),
                        Text(AppLocalizations.of(context).translate("stats_medium")+'  '+get_best_time_medium(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery. of(context). size. height/20)
                        ),
                  SizedBox(height:MediaQuery. of(context). size. height/30),
                  Text(AppLocalizations.of(context).translate("stats_hard")+'  '+get_best_time_hard
                    (),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery. of(context). size. height/20)
                  ),
                  SizedBox(height:MediaQuery. of(context). size. height/30),
      FlatButton.icon(onPressed:()=> {
      setState(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("best_time_easy_minutes", null);
      prefs.setString("best_time_medium_minutes", null);
      prefs.setString("best_time_hard_minutes", null);
      prefs.setString("best_time_easy", null);
      prefs.setString("best_time_medium", null);
      prefs.setString("best_time_hard", null);
      })
      }, icon: Icon(Icons.autorenew,
        color: GameColors.tertiary,
        size: MediaQuery
            .of(context)
            .size
            .height / 15,),
      label:Text(''))
                      ]
                  ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: GameColors.tertiary,
                          spreadRadius: MediaQuery
                              .of(context)
                              .size
                              .height / 100),
                    ],
                    borderRadius: BorderRadius.circular(MediaQuery
                        .of(context)
                        .size
                        .height / 30)
                ),
              ),
            ]
        ),
    )
    );
  }
  get_Best_Time_Easy() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      best_time_easy=prefs.getString('best_time_easy');
      if(best_time_easy==null){
        best_time_easy='--:--';
      }
    });
  }
  String get_best_time_easy(){
    get_Best_Time_Easy();
    return best_time_easy;
  }
  get_Best_Time_Medium() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      best_time_medium=prefs.getString('best_time_medium');
      if(best_time_medium==null){
        best_time_medium='--:--';
      }
    });
  }
  String get_best_time_medium(){
    get_Best_Time_Medium();
    return best_time_medium;
  }
  get_Best_Time_Hard() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      best_time_hard=prefs.getString('best_time_hard');
      if(best_time_hard==null){
        best_time_hard='--:--';
      }
    });
  }
  String get_best_time_hard(){
    get_Best_Time_Hard();
    return best_time_hard;
  }

}