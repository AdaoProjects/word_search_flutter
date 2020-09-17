import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:findthewords/custom_painter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:findthewords/utilites/colors.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:findthewords/app_localizations.dart';
AudioCache audioPlayer = AudioCache();
class Game_Medium extends StatefulWidget {

  @override
  _Game_MediumState createState() => _Game_MediumState();
}

class _Game_MediumState extends State<Game_Medium> with TickerProviderStateMixin {

  //Puzzle
  List<String> puzzle = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int count = -2;
  int no_conection_count=0;
  Random random = new Random();
  List<String> words = ['', '', '', '', '','','',''];
  List<String> all;
  int num_rows_and_columns=10;

  bool word_one_scratch =false;
  bool word_two_scratch=false;
  bool word_three_scratch=false;
  bool word_four_scratch=false;
  bool word_five_scratch=false;
  bool word_six_scratch=false;
  bool word_seven_scratch=false;
  bool word_eight_scratch=false;
  int word_one_reverse ;
  int word_two_reverse ;
  int word_three_reverse ;
  int word_four_reverse ;
  int word_five_reverse ;
  int word_six_reverse ;
  int word_seven_reverse;
  int word_eight_reverse;
  int row_one;
  int column_one;
  int row_two;
  int column_two;
  int row_three;
  int column_three;
  int row_four;
  int column_four;
  int row_five;
  int column_five;
  int row_six;
  int column_six;
  int row_seven;
  int column_seven;
  int row_eight;
  int column_eight;
  int sorted_Num_Words;
//Paint
  bool fisrt_Point_drawed=false;
  int number_Of_Words_Selected=0;
  int init_Pan_Update=0;
  List<int> solution_positions=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,];
  int row_start;
  int column_start;
  int row_end=0;
  int column_end=0;
  double start_Of_Selection_dx;
  double start_Of_Selection_dy;
  double end_Of_Selection_dx;
  double end_Of_Selection_dy;
  List<DrawingPoints> points = List();
  StrokeCap strokeCap = (Platform.isAndroid) ? StrokeCap.butt : StrokeCap.round;
  Color selected_color;
  double opacity = 0.2;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.pink
  ];
  int next_Color=0;
  //Timer
  int _seconds=0;
  int _minutes=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) async {
            RenderBox box = context.findRenderObject();
            final Offset local = box.globalToLocal(
                details.globalPosition);
            for (int row = 0; row < num_rows_and_columns; row++) {
              for (int column = 0; column < num_rows_and_columns; column++) {
                if (local.dx > MediaQuery
                    .of(context)
                    .size
                    .width / 18.4
                    + column * MediaQuery
                        .of(context)
                        .size
                        .width / 11.28 && local.dx < MediaQuery
                    .of(context)
                    .size
                    .width / 18.4 + (column + 1) * MediaQuery
                    .of(context)
                    .size
                    .width / 11.28

                    && local.dy > MediaQuery
                        .of(context)
                        .size
                        .height / 3.97 + row * MediaQuery
                        .of(context)
                        .size
                        .height / 18.75 && local.dy < MediaQuery
                    .of(context)
                    .size
                    .height / 3.97 + (row + 1) * MediaQuery
                    .of(context)
                    .size
                    .height / 18.75) {
                  end_Of_Selection_dx = MediaQuery
                      .of(context)
                      .size
                      .width / 18.4 + (column + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .width / 11.28;
                  end_Of_Selection_dy = MediaQuery
                      .of(context)
                      .size
                      .height / 3.97 + (row + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .height / 18.75;
                  if(row_end!=row || column_end!=column){
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    if(prefs.getBool("has_Sounds")==true) {
                      audioPlayer.play('sounds/selectionsound.wav');
                    }

                  }
                  row_end=row;
                  column_end=column;
                  if(init_Pan_Update!=0) {
                    points.removeAt(2*number_Of_Words_Selected + 1);
                  }init_Pan_Update=1;
                  setState(() {
                    points.add(DrawingPoints(
                    radius:  MediaQuery
                          .of(context)
                          .size
                          .height / 18.75,
                      first:false,
                      points: Offset(
                        end_Of_Selection_dx,
                        end_Of_Selection_dy,),
                      paint: Paint()
                        ..strokeCap = strokeCap
                        ..isAntiAlias = true
                        ..color = selected_color.withOpacity(
                            opacity)
                        ..strokeWidth = MediaQuery
                            .of(context)
                            .size
                            .height / 18.75,
                    ));
                    count=-1;
                  });
                }
              }
            }

          },
          onPanStart: (details) async {
            RenderBox box = context.findRenderObject();
            if(!fisrt_Point_drawed) {
              final Offset local = box.globalToLocal(
                  details.globalPosition);
              for (int row = 0; row < num_rows_and_columns; row++) {
                for (int column = 0; column < num_rows_and_columns; column++) {
                  if (local.dx > MediaQuery
                      .of(context)
                      .size
                      .width / 18.4
                      + column * MediaQuery
                          .of(context)
                          .size
                          .width / 11.28 && local.dx < MediaQuery
                      .of(context)
                      .size
                      .width / 18.4 + (column + 1) * MediaQuery
                      .of(context)
                      .size
                      .width / 11.28

                      && local.dy > MediaQuery
                          .of(context)
                          .size
                          .height / 3.97 + row * MediaQuery
                          .of(context)
                          .size
                          .height / 18.75 && local.dy < MediaQuery
                      .of(context)
                      .size
                      .height / 3.97 + (row + 1) * MediaQuery
                      .of(context)
                      .size
                      .height / 18.75) {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    if(prefs.getBool("has_Sounds")==true) {
                      audioPlayer.play('sounds/selectionsound.wav');
                    }

                    setState(() {
                      start_Of_Selection_dx=MediaQuery
                          .of(context)
                          .size
                          .width / 18.4 +
                          (column + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .width / 11.28;
                      start_Of_Selection_dy=MediaQuery
                          .of(context)
                          .size
                          .height / 3.97 +
                          (row + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .height / 18.75;

                      row_start=row;
                      column_start=column;
                      points.add(DrawingPoints(
                        radius:  MediaQuery
                            .of(context)
                            .size
                            .height / 18.75,
                        first:true,
                        points: Offset(start_Of_Selection_dx, start_Of_Selection_dy),
                        paint: Paint()
                          ..strokeCap = strokeCap
                          ..isAntiAlias = true
                          ..color = serie_Color().withOpacity(
                              opacity)
                          ..strokeWidth = MediaQuery
                              .of(context)
                              .size
                              .height / 18.75,


                      ));
                      count = -1;
                      init_Pan_Update=0;
                    });
                  }
                }
              }
            }
            fisrt_Point_drawed=true;
          },
          onPanEnd: (details) async {
            bool found_word=false;
            for(int i =0 ;i<words.length;i++){
              if(
              row_start==solution_positions[4*i]&&
                  column_start==solution_positions[4*i+1]&&
                  row_end==solution_positions[4*i+2]&&
                  column_end==solution_positions[4*i+3]
                  ||
                  row_start==solution_positions[4*i+2]&&
                      column_start==solution_positions[4*i+3]&&
                      row_end==solution_positions[4*i]&&
                      column_end==solution_positions[4*i+1]){
                found_word=true;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                if(prefs.getBool("has_Sounds")==true) {
                  audioPlayer.play('sounds/foundsound.wav');
                }
                number_Of_Words_Selected++;
                if(i==0 ){
                  setState(() {
                    word_one_scratch=true;
                  });
                }else if(i==1 ){
                  setState(() {
                    word_two_scratch=true;
                  });
                }else if(i==2 ){
                  setState(() {
                    word_three_scratch=true;
                  });
                }else if(i==3){
                  setState(() {
                    word_four_scratch=true;
                  });
                }else if(i==5){
                  setState(() {
                    word_six_scratch=true;
                  });
                }else if(i==6){
                  setState(() {
                    word_seven_scratch=true;
                  });
                }else if(i==7){
                  setState(() {
                    word_eight_scratch=true;
                  });
                }
                else {
                  setState(() {
                    word_five_scratch=true;
                  });
                }
              }
            }
            if(!found_word){
              points.removeAt(2*number_Of_Words_Selected+1);
              points.removeAt(2*number_Of_Words_Selected);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if(prefs.getBool("has_Sounds")==true) {
                audioPlayer.play('sounds/wrongsound.wav');
              }
            }
            if(word_one_scratch==true && word_two_scratch==true && word_three_scratch==true&&word_four_scratch==true&&word_five_scratch==true){
              set_Best_Time();
              showDialog(
                context: context,
                builder: (alertContext) => AlertDialog(
                  title: const Text("You won"),
                  content:  Text('Congratulations your time was '+_minutes.toString()+':'+_seconds.toString()),
                  actions: [
                    new FlatButton(
                      child: const Text("Ok"),
                      onPressed: () {
                        Navigator.pop(alertContext);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            }
            fisrt_Point_drawed=false;
          },

          child: CustomPaint(
            size: Size.infinite,
            foregroundPainter:DrawingPainter(
              pointsList: points,
            ) ,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/artecriada.jpg',
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 7,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width),
                  Row(
                      children: [
                       SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 15),
                        Text(AppLocalizations.of(context).translate("game_level_medium"),
                          style: TextStyle(fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 25,
                            color:Colors.white,),
                        ),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 15),
                        //Timer
                        Icon(Icons.timer,
                          color: Colors.white,
                          size: MediaQuery
                              .of(context)
                              .size
                              .height / 25,),
                        return_Timer()
                      ]
                  ),
                  SizedBox(height:MediaQuery
                      .of(context)
                      .size
                      .height / 25),
                  Container(
                    width:MediaQuery
                        .of(context)
                        .size
                        .width* 8/ 10 *1.1,
                    child:Table(
                      children: [
                        TableRow(
                          children: [
                             Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                            Container(
                              width:  MediaQuery
                                  .of(context)
                                  .size
                                  .width/12*1.1,
                              height:  MediaQuery
                                  .of(context)
                                  .size
                                  .height /18.75,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),) ,

                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                              color: GameColors.button_Background_Light, spreadRadius: MediaQuery.of(context).size.height/100),
                        ],
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/30)
                    ),
                  ),
                  SizedBox(height:MediaQuery
                      .of(context)
                      .size
                      .height / 25),
                  Container(
                    width:MediaQuery
                        .of(context)
                        .size
                        .width* 3/ 5 ,
                    child: Table(
                        children: [
                          TableRow( children:[
                            Row(children:[
                              SizedBox(width:MediaQuery.of(context).size.width/15),
                              (word_eight_scratch && sorted_Num_Words==6)||(word_seven_scratch && sorted_Num_Words==5)|| (word_six_scratch && sorted_Num_Words==4)||(word_one_scratch && sorted_Num_Words==7)||  (word_one_scratch && sorted_Num_Words==7)  || (word_one_scratch && sorted_Num_Words==7) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words()+', ' ,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              )):Center(child:Text(return_Sorted_Words()+',' ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),),
                              SizedBox(width:MediaQuery.of(context).size.width/17),
                              (word_eight_scratch && sorted_Num_Words==6)||(word_seven_scratch && sorted_Num_Words==5)|| (word_six_scratch && sorted_Num_Words==4)||(word_one_scratch && sorted_Num_Words==7) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Text(return_Sorted_Words() ,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ):Text(return_Sorted_Words() ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              )
                            ]
                            ),
                          ]),


                          TableRow( children:[
                            Row(children:[
                              SizedBox(width:MediaQuery.of(context).size.width/15),
                              (word_eight_scratch && sorted_Num_Words==6)||(word_seven_scratch && sorted_Num_Words==5)|| (word_six_scratch && sorted_Num_Words==4)||(word_one_scratch && sorted_Num_Words==7) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words()+', ' ,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              )):Center(child:Text(return_Sorted_Words()+',' ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),),
                              SizedBox(width:MediaQuery.of(context).size.width/17),
                              (word_eight_scratch && sorted_Num_Words==6)||(word_seven_scratch && sorted_Num_Words==5)|| (word_six_scratch && sorted_Num_Words==4)||(word_one_scratch && sorted_Num_Words==7) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),):Center(child:Text(return_Sorted_Words() ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),),
                            ]
                            ),
                          ]
                          ),


                          TableRow( children:[
                            Row(children:[
                              SizedBox(width:MediaQuery.of(context).size.width/15),
                              (word_eight_scratch && sorted_Num_Words==6)||(word_seven_scratch && sorted_Num_Words==5)|| (word_six_scratch && sorted_Num_Words==4)||(word_one_scratch && sorted_Num_Words==7) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words()+', ' ,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              )):Center(child:Text(return_Sorted_Words()+',' ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),),
                              SizedBox(width:MediaQuery.of(context).size.width/17),
                              (word_eight_scratch && sorted_Num_Words==6)||(word_seven_scratch && sorted_Num_Words==5)|| (word_six_scratch && sorted_Num_Words==4)||(word_one_scratch && sorted_Num_Words==7) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),):Center(child:Text(return_Sorted_Words() ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),),
                            ]
                            ),
                          ]
                          ),


                          TableRow( children:[
                            Row(children:[
                              SizedBox(width:MediaQuery.of(context).size.width/15),
                              (word_eight_scratch && sorted_Num_Words==6)||(word_seven_scratch && sorted_Num_Words==5)|| (word_six_scratch && sorted_Num_Words==4)||(word_one_scratch && sorted_Num_Words==7) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words()+', ' ,
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              )):Center(child:Text(return_Sorted_Words()+',' ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),),
                              SizedBox(width:MediaQuery.of(context).size.width/17),
                              (word_eight_scratch && sorted_Num_Words==6)||(word_seven_scratch && sorted_Num_Words==5)|| (word_six_scratch && sorted_Num_Words==4)||(word_one_scratch && sorted_Num_Words==7) ||(word_two_scratch && sorted_Num_Words==0)||(word_three_scratch && sorted_Num_Words==1)||(word_four_scratch && sorted_Num_Words==2)||(word_five_scratch && sorted_Num_Words==3) ? Center(child:Text(return_Sorted_Words(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),):Center(child:Text(return_Sorted_Words() ,
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color:Colors.black),
                              ),),
                            ]
                            ),
                          ]
                          ),

                        ]
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                            color: GameColors.button_Background_Light, spreadRadius: MediaQuery.of(context).size.height/100),

                      ],
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height/30) ,
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),

    );
  }

  String write_Random_Letter() {
    List<String> letters = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];
    Random random = new Random();
    return letters[random.nextInt(26)];
  }

  create_Puzzle_Random(){
    if (count == -2) {
      count++;
      set_language();
      for (int i = 0; i < num_rows_and_columns*num_rows_and_columns; i++) {
        puzzle[i] = write_Random_Letter();
      }
      pick_Random_Words();
      fit_Words_Puzzle(
          puzzle, words[0], words[1], words[2], words[3], words[4],words[5],words[6],words[7]);
      write_Words_Puzzle(puzzle, words[0], words[1], words[2], words[3], words[4],words[5],words[6],words[7]);
      sorted_Num_Words=random.nextInt(8)-1;
      next_Color=random.nextInt(5);
    }
  }
  String return_Sorted_Words(){
    sorted_Num_Words++;
    if(sorted_Num_Words==8){
      sorted_Num_Words=0;
    }
    return words[sorted_Num_Words];
  }
  String write_Puzzle_Letter() {
    create_Puzzle_Random();
    count++;
    if (count == num_rows_and_columns*num_rows_and_columns) {
      count=0;
    }
    return puzzle[count];
  }
  fit_Words_Puzzle(List<String> puzzle, String word_one, String word_two,
      String word_three, String word_four, String word_five,String word_six, String word_seven, String word_eight) {

    // the row and column from the 'beginer of the words', rigth is positive and down is positive, later the word can be changed to reversed order so it makes more difficult the puzzle
    row_one = random.nextInt(num_rows_and_columns);
    column_one = random.nextInt(num_rows_and_columns - word_one.length + 1);
    row_two = random.nextInt(num_rows_and_columns);
    column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
    row_three = random.nextInt(num_rows_and_columns - word_three.length + 1);
    column_three = random.nextInt(num_rows_and_columns);
    row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);
    column_four = random.nextInt(num_rows_and_columns);

    row_five = random.nextInt(num_rows_and_columns - word_five.length + 1);
    column_five = random.nextInt(((num_rows_and_columns-word_five.length+1)/2).toInt())*2+row_five%2;


    row_six = random.nextInt(num_rows_and_columns);
    column_six = random.nextInt(num_rows_and_columns - word_one.length + 1);

    row_seven = random.nextInt(num_rows_and_columns - word_seven.length + 1);
    column_seven = random.nextInt(num_rows_and_columns);

    row_eight = random.nextInt(num_rows_and_columns - word_eight.length + 1);
    column_eight = 9-random.nextInt(((num_rows_and_columns-word_eight.length+1)/2).toInt())*2+row_eight%2;


    int num_of_tentatives=0;
    bool conection = false;
    word_one_reverse = random.nextInt(2);
    word_two_reverse = random.nextInt(2);
    word_three_reverse = random.nextInt(2);
    word_four_reverse = random.nextInt(2);
    word_five_reverse = random.nextInt(2);
    word_six_reverse = random.nextInt(2);
    word_seven_reverse=random.nextInt(2);
    word_eight_reverse=random.nextInt(2);

  int k=0;

    for (int i = 0; i < word_five.length; i++) {
      for (int j = 0; j < word_one.length; j++) {
        if (word_five[i] == word_one[j]) {
          conection = true;
          if (random.nextInt(2) == 0) {
            row_one = row_five + i;
            column_one = column_five + i - j;
            for (int i = 0; i < word_eight.length; i++) {
              for (int j = 0; j < word_one.length; j++) {
                if (!(row_eight + i == row_one &&
                    column_eight - i == column_one+j ) ){
                  k++;
                }
              }
            }
            if (column_one < 0 ||
                column_one > num_rows_and_columns - word_one.length || k!=0) {
              no_conection_count++;
              if (no_conection_count < 5) {
                fit_Words_Puzzle(
                    puzzle,
                    word_one,
                    word_two,
                    word_three,
                    word_four,
                    word_five,
                    word_six,
                word_seven,
                word_eight);
              } else {
                conection = false;
              }
            } else {
              word_one_reverse = 0;
              word_five_reverse = 0;
            }
          } else {
            row_one = row_five + word_five.length - i - 1;
            column_one =
                column_five + word_five.length - i + j -1;
            for (int i = 0; i < word_eight.length; i++) {
              for (int j = 0; j < word_one.length; j++) {
                if (!(row_eight + i == row_one &&
                    column_eight - i == column_one+j ) ){
                  k++;
                }
              }
            }
            if (column_one < 0 ||
                column_one > num_rows_and_columns - word_one.length ||k!=0) {
              no_conection_count++;
              if (no_conection_count < 5) {
                fit_Words_Puzzle(
                    puzzle,
                    word_one,
                    word_two,
                    word_three,
                    word_four,
                    word_five,
                    word_six,
                  word_seven,
                  word_eight
                );
              } else {
                conection = false;
              }
            } else {
              word_one_reverse = 1;
              word_five_reverse = 1;
            }
          }
        }
      }
    }
    if (!conection) {
      int k = 0;
      while (k < word_five.length * word_one.length) {
        k = 0;
        row_one =
            random.nextInt(num_rows_and_columns);
        column_one =
            random.nextInt(num_rows_and_columns - word_one.length + 1);
        for (int i = 0; i < word_five.length; i++) {
          for (int j = 0; j < word_one.length; j++) {
            if (!(row_five + i == row_one &&
                column_five + i == column_one + j)) {
              k++;
            }
          }
        }
      }
    }

    k = 0;
    while (k < (word_five.length * word_two.length+word_eight.length * word_two.length)) {
      k = 0;
      row_two =
          random.nextInt(num_rows_and_columns);
      column_two =
          random.nextInt(num_rows_and_columns - word_two.length + 1);
      for (int i = 0; i < word_five.length; i++) {
        for (int j = 0; j < word_two.length; j++) {
          if (!((row_five + i == row_two &&
              column_five + i == column_two + j) || row_one == row_two)) {
            k++;
          }
        }
      }
        for (int i = 0; i < word_eight.length; i++) {
          for (int j = 0; j < word_two.length; j++) {
            if (!((row_eight + i == row_two &&
                column_eight - i == column_two + j) || row_one == row_two)) {
              k++;
            }
          }
      }
    }

    conection = false;
    for (int i = 0; i < word_two.length; i++) {
      for (int j = 0; j < word_three.length; j++) {
        if (word_two[i] == word_three[j]) {
          conection = true;
          if (random.nextInt(2) == 0) {
            row_three = row_two - j;
            column_three = column_two + i;
            k = 0;
            for (int p = 0; p < word_five.length; p++) {
              for (int l = 0; l < word_three.length; l++) {
                if (((row_five + p == row_three + l &&
                    column_five + p == column_three) ||
                    ((row_three <= row_one &&
                        row_three + word_three.length - 1 >= row_one) &&
                        (column_three >= column_one &&
                            column_three <=
                                column_one + word_one.length - 1)))) {
                  k++;
                }
              }
            }

            for (int i = 0; i < word_eight.length; i++) {
              for (int j = 0; j < word_three.length; j++) {
                if (!(row_eight + i == row_three &&
                    column_eight - i == column_three+j)) {
                  k++;
                }
              }
            }
            if (row_three < 0 ||
                row_three > num_rows_and_columns - word_three.length ||
                k != 0) {
              no_conection_count++;
              if (no_conection_count < 5) {
                fit_Words_Puzzle(
                    puzzle,
                    word_three,
                    word_two,
                    word_three,
                    word_four,
                    word_five,
                    word_six,
                word_seven,
                word_eight);
              } else {
                conection = false;
              }
            } else {
              word_three_reverse = 0;
              word_two_reverse = 0;
            }
          } else {
            row_three = row_two - word_three.length + j + 1;
            column_three = column_two + word_two.length - i - 1;
            k = 0;
            for (int p = 0; p < word_five.length; p++) {
              for (int l = 0; l < word_three.length; l++) {
                if (((row_five + p == row_three + l &&
                    column_five + p == column_three) ||
                    ((row_three <= row_one &&
                        row_three + word_three.length - 1 >= row_one) &&
                        (column_three >= column_one &&
                            column_three <=
                                column_one + word_one.length - 1)))) {
                  k++;
                }
              }
            }
            for (int i = 0; i < word_eight.length; i++) {
              for (int j = 0; j < word_three.length; j++) {
                if (!(row_eight + i == row_three +j &&
                    column_eight - i == column_three)) {
                  k++;
                }
              }
            }
            if (row_three < 0 ||
                row_three > num_rows_and_columns - word_three.length ||
                k != 0) {
              no_conection_count++;
              if (no_conection_count < 5) {
                fit_Words_Puzzle(
                    puzzle,
                    word_three,
                    word_two,
                    word_three,
                    word_four,
                    word_five,
                    word_six,
                word_seven,
                word_eight);
              } else {
                conection = false;
              }
            } else {
              word_three_reverse = 1;
              word_two_reverse = 1;
            }
          }
        }
      }
    }
    if (!conection) {
      num_of_tentatives = 0;
      k = 0;
      while (k < (word_five.length+word_eight.length) * word_three.length) {
        k = 0;
        row_three =
            random.nextInt(num_rows_and_columns - word_three.length + 1);
        column_three = random.nextInt(num_rows_and_columns);
        num_of_tentatives++;
        if (num_of_tentatives > 100) {
          fit_Words_Puzzle(
              puzzle,
              word_one,
              word_two,
              word_three,
              word_four,
              word_five,
              word_six,
          word_seven,
          word_eight);
        }
        for (int i = 0; i < word_five.length; i++) {
          for (int j = 0; j < word_three.length; j++) {
            if (!((row_five + i == row_three + j &&
                column_five + i == column_three) || ((row_three <= row_one &&
                row_three + word_three.length - 1 >= row_one) &&
                (column_three >= column_one &&
                    column_three <= column_one + word_one.length - 1)) ||
                ((row_three <= row_two &&
                    row_three + word_three.length - 1 >= row_two) &&
                    (column_three >= column_two &&
                        column_three <= column_two + word_two.length - 1)))) {
              k++;
            }
          }
        }
        for (int i = 0; i < word_eight.length; i++) {
          for (int j = 0; j < word_three.length; j++) {
            if (!(row_eight + i == row_three +j &&
                column_eight - i == column_three)) {
              k++;
            }
          }
        }
      }
    }
    num_of_tentatives = 0;
    k = 0;
    while (k < (word_five.length+word_eight.length) * word_four.length) {
      k = 0;
      row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);
      column_four = random.nextInt(num_rows_and_columns);
      num_of_tentatives++;
      if (num_of_tentatives > 100) {
        fit_Words_Puzzle(
            puzzle,
            word_one,
            word_two,
            word_four,
            word_four,
            word_five,
            word_six,
        word_seven,
        word_eight);
      }
      for (int i = 0; i < word_five.length; i++) {
        for (int j = 0; j < word_four.length; j++) {
          if (!(column_four == column_three || ((row_five + i == row_four + j &&
              column_five + i == column_four) || ((row_four <= row_one &&
              row_four + word_four.length - 1 >= row_one) &&
              (column_four >= column_one &&
                  column_four <= column_one + word_one.length - 1)) ||
              ((row_four <= row_two &&
                  row_four + word_four.length - 1 >= row_two) &&
                  (column_four >= column_two &&
                      column_four <= column_two + word_two.length - 1))))) {
            k++;
          }
        }
      }
      for (int i = 0; i < word_eight.length; i++) {
        for (int j = 0; j < word_four.length; j++) {
          if (!(row_eight + i == row_four +j &&
              column_eight - i == column_four)) {
            k++;
          }
        }
      }
    }
    for (int f = 0; f < num_rows_and_columns; f++) {
      for (int l = 0; l < num_rows_and_columns-word_six.length+1; l++) {
        k = 0;
        row_six = f;
        column_six = l;
        for (int i = 0; i < word_five.length; i++) {
          for (int j = 0; j < word_six.length; j++) {
            if (!((row_five + i == row_six &&
                column_five + i == column_six + j) || row_six == row_one ||
                row_six == row_two ||
                (column_six <= column_four &&
                    column_six + word_six.length - 1 >= column_four &&
                    row_six >= row_four &&
                    row_six <= row_four + word_four.length - 1)
                || (column_six <= column_three &&
                    column_six + word_six.length - 1 >= column_three &&
                    row_six >= row_three &&
                    row_six <= row_three + word_three.length - 1)) ){
              k++;
            }
          }
        }
        for (int i = 0; i < word_eight.length; i++) {
          for (int j = 0; j < word_six.length; j++) {
            if (!((row_eight + i == row_six &&
                column_eight - i == column_six + j) || row_one == row_two)) {
              k++;
            }
          }
        }
        if (k == (word_five.length+word_eight.length) * word_six.length) {
          break;
        }
      }
      if (k == (word_five.length+word_eight.length)* word_six.length) {
        break;
      }
    }
    for (int f = 0; f < num_rows_and_columns-word_seven.length+1; f++) {
      for (int l = 0; l < num_rows_and_columns; l++) {
        k = 0;
        row_seven = f;
        column_seven = l;
        for (int i = 0; i < word_five.length; i++) {
          for (int j = 0; j < word_seven.length; j++) {
            if (!((row_five + i == row_seven+j &&
                column_five + i == column_seven) || column_seven == column_three ||
                column_seven == column_four ||
                (row_seven <= row_one &&
                    row_seven + word_seven.length - 1 >= row_one &&
                    column_seven >= column_one &&
                    column_seven <= column_one + word_one.length - 1)
                || (row_seven <= row_two &&
                    row_seven + word_seven.length - 1 >= row_two &&
                    column_seven >= column_two &&
                    column_seven<= column_two + word_two.length - 1)
                || (row_seven <= row_six &&
                    row_seven + word_seven.length - 1 >= row_six &&
                    column_seven >= column_six &&
                    column_seven<= column_six + word_six.length - 1)) ){
              k++;
            }
          }
        }
        for (int i = 0; i < word_eight.length; i++) {
          for (int j = 0; j < word_seven.length; j++) {
            if (!(row_eight + i == row_seven +j&&
                column_eight - i == column_seven)) {
              k++;
            }
          }
        }
        if (k == (word_five.length+word_eight.length) * word_six.length) {
          break;
        }
      }
      if (k == (word_five.length+word_eight.length)* word_six.length) {
        break;
      }
    }
  }
  write_Words_Puzzle(List<String> puzzle, String word_one,String word_two,String word_three,String word_four,String word_five,String word_six,String word_seven,String word_eight) {
    if (word_five_reverse == 0) {
      for (int i = 0; i < word_five.length; i++) {
        puzzle[(row_five + i) * num_rows_and_columns + column_five + i] =
        word_five[i];
      }
    } else {
      for (int i = 0; i < word_five.length; i++) {
        puzzle[(row_five + i) * num_rows_and_columns + column_five + i] =
        word_five[word_five.length - 1 - i];
      }
    }
    if (word_one_reverse == 0) {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * num_rows_and_columns + i + column_one] = word_one[i];
      }
    } else {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * num_rows_and_columns + i + column_one] =
        word_one[word_one.length - 1 - i];
      }
    }
    if (word_two_reverse == 0) {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * num_rows_and_columns + i + column_two] = word_two[i];
      }
    } else {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * num_rows_and_columns + i + column_two] =
        word_two[word_two.length - 1 - i];
      }
    }

    if (word_three_reverse == 0) {
      for (int i = 0; i < word_three.length; i++) {
        puzzle[(row_three + i) * num_rows_and_columns + column_three] =
        word_three[i];
      }
    } else {
      for (int i = 0; i < word_three.length; i++) {
        puzzle[(row_three + i) * num_rows_and_columns + column_three] =
        word_three[word_three.length - 1 - i];
      }
    }
    if (word_four_reverse == 0) {
      for (int i = 0; i < word_four.length; i++) {
        puzzle[(row_four + i) * num_rows_and_columns + column_four] =
        word_four[i];
      }
    } else {
      for (int i = 0; i < word_four.length; i++) {
        puzzle[(row_four + i) * num_rows_and_columns + column_four] =
        word_four[word_four.length - 1 - i];
      }
    }

    if (word_six_reverse == 0) {
      for (int i = 0; i < word_six.length; i++) {
        puzzle[row_six * num_rows_and_columns + i + column_six] = word_six[i];
      }
    } else {
      for (int i = 0; i < word_six.length; i++) {
        puzzle[row_six * num_rows_and_columns + i + column_six] =
        word_six[word_six.length - 1 - i];
      }
    }

    if (word_seven_reverse == 0) {
      for (int i = 0; i < word_seven.length; i++) {
        puzzle[(i+row_seven)* num_rows_and_columns + column_seven] = word_seven[i];
      }
    } else {
      for (int i = 0; i < word_seven.length; i++) {
        puzzle[(row_seven+i) * num_rows_and_columns + column_six] =
        word_seven[word_seven.length - 1 - i];
      }
    }
    if (word_eight_reverse == 0) {
      for (int i = 0; i < word_eight.length; i++) {
        puzzle[(row_eight + i) * num_rows_and_columns + column_eight - i] =
        word_eight[i];
      }
    } else {
      for (int i = 0; i < word_eight.length; i++) {
        puzzle[(row_eight + i) * num_rows_and_columns + column_eight - i] =
        word_eight[word_eight.length - 1 - i];
      }
    }
  }

  pick_Random_Words() {
    Random random = new Random();
    int one = random.nextInt(25);
    int two = random.nextInt(25);
    int three = random.nextInt(25);
    int four = random.nextInt(25);
    int five = random.nextInt(25);
    int six =random.nextInt(25);
    int seven=random.nextInt(25);
    int eight= random.nextInt(25);
    while ((all[one].length!=5 && all[one].length!=6)||(all[two].length!=5 && all[two].length!=6)||all[three].length != 5 || all[four].length !=5 || all[five].length != 5||all[six].length != 5||all[seven].length != 5||all[eight].length != 5|| one==two||one==three||one==four||one==five||one==six||one==seven||one==eight||two==three||two==four||two==five||two==six||two==seven||two==eight ||three==four||three==five||three==six||three==seven||three==eight||four==five||four==six||four==seven||four==eight||five==six||five==seven||five==eight||six==seven||six==eight||seven==eight) {
      one = random.nextInt(25);
      two = random.nextInt(25);
      three = random.nextInt(25);
      four = random.nextInt(25);
      five = random.nextInt(25);
      six = random.nextInt(25);
      seven = random.nextInt(25);
      eight = random.nextInt(25);
    }

    words[0] = all[one];
    words[1] = all[two];
    words[2] = all[three];
    words[3] = all[four];
    words[4] = all[five];
    words[5] = all[six];
    words[6] = all[seven];
    words[7] = all[eight];
  }

  Color serie_Color(){
    next_Color++;
    if(next_Color==5){
      next_Color=0;
    }
    selected_color=colors[next_Color];
    return selected_color;
  }

//Timer
  @override
  void dispose() {
    super.dispose();

  }
  @override
  void initState() {

    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    _seconds++;
    if(_seconds==60){
      _minutes++;
      _seconds=0;
    }
    setState(() {
    });
  }
  Text return_Timer(){
    Duration duration =Duration(seconds:_seconds+60*_minutes);
    return Text(_stringDuration(duration),
      style: TextStyle(fontSize: MediaQuery
          .of(context)
          .size
          .height / 25,
        color: Colors.white,),);
  }
  String _stringDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
  set_Best_Time() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int time_now=_minutes*60+_seconds;
    int old_best_time_minutes = (prefs.getInt('best_time_medium_minutes') ?? null);
    int old_best_time_seconds=(prefs.getInt('best_time_medium_seconds') ?? null);
    int old_time;
    if(old_best_time_minutes==null ||old_best_time_seconds==null){
      old_time=0;
    }else {
      old_time = old_best_time_minutes * 60 + old_best_time_seconds;
    }
    if(time_now<old_time || old_time==0){
      await prefs.setInt('best_time_medium_minutes', _minutes);
      await prefs.setInt('best_time_medium_seconds', _seconds);
      String best_time=_stringDuration(Duration(seconds:60*_minutes+_seconds));
      prefs.setString('best_time_medium', best_time);
      Navigator.of(context).pushNamed("/stats");
    }
  }
  set_language(){
    String language=AppLocalizations.of(context).translate("game_language");
    if(language=='en'){
      all=[
        "adult",
        "album",
        "agent",
        "angle",
        "apple",
        "pixel",

        "labor",
        "gifts",
        "girls",
        "forum",
        "dress",
        "dance",

        "bonus",
        "board",
        "blade",
        "block",
        "bills",
        "bible",

        "afford",
        "allows",
        "animal",
        "annual",
        "advice",
        "actual",
        "action",


      ];
    }else if (language=='pt'){
      all=[
        "banco",
        "clube",
        "exame",
        "olhos",
        "album",
        "forum",
        "dança",
        "bonus",
        "borda" ,
        "quadra" ,
        "contas" ,
        "biblia",
        "animal" ,
        "anual",
        "adendo" ,

        "sagaz" ,
        "algoz",
        "sutil" ,
        "ideia",
        "moral" ,

        "gleba" ,
        "denso",
        "causa" ,
        "fugaz",
        "sonho" ,

      ];
    }else if(language=='fr'){
      all=[

        "acide",
        "Balle" ,
        "pieds" ,
        "album",
        "agent",
        "angle" ,
        "Pomme" ,

        "adulte",
         "filles" ,
        "forum",
        "Danse" ,

        "prime" ,
        "planche" ,
        "bloquer" ,
        "bible",

        "animal" ,
        "annuel",
        "action",

        "TWILL",
        "TWINS" ,
        "WOLOF" ,
        "AWELE",
        "WALES",
        "WAGON" ,
        "KIWIS" ,
      ];
    }else if (language=='es'){
      all=[
        "album",
        "agente" ,
        "sangre",
        "labor" ,
        "baile" ,
        "biblia",
        "pagar",
        "animal",
        "anual",
        "Consejo" ,
        "actual",
        "accion",

        "ANOLE",
        "ANUDO" ,
        "APITA",
        "AGITA" ,
        "AHORA" ,
        "AFARA",
        "AFATO",
        "AILLO",
        "AGORA",
        "AGNUS" ,
        "AGUAN",
        "AGRIO",
        "ALBOS",
      ];
    }
  }
}
