import 'package:flutter/material.dart';
import 'package:huntersofwords/screens/game_easy.dart';
import 'package:huntersofwords/screens/game_medium.dart';
import 'package:huntersofwords/screens/game_hard.dart';
import 'package:huntersofwords/utilites/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}
class _StatsState extends State<Stats> {
  String best_time_easy;
  String best_time_medium;
  String best_time_hard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child:Column(children:[ Text(get_best_time_easy()),
              Text(get_best_time_medium()),
              Text(get_best_time_hard())]
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