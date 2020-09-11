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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Text(get_best_time_easy())
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
}