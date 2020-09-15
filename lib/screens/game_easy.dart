import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:findthewords/utilites/colors.dart';
import 'package:findthewords/custom_painter.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:findthewords/app_localizations.dart';
AudioCache audioPlayer = AudioCache();
class Game_Easy extends StatefulWidget {
  @override
  _Game_EasyState createState() => _Game_EasyState();
}

class _Game_EasyState extends State<Game_Easy> with TickerProviderStateMixin {

  //Puzzle
  List<String> all;
  List<String> puzzle=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];
  int count = -2;
  Random random = new Random();
  List<String> words = ['', '', '', '', ''];
  int num_rows_and_columns = 8;
  bool word_one_scratch = false;
  bool word_two_scratch = false;
  bool word_three_scratch = false;
  bool word_four_scratch = false;
  bool word_five_scratch = false;
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
  int sorted_Num_Words;

//Paint
  bool fisrt_Point_drawed = false;
  int number_Of_Words_Selected = 0;
  int init_Pan_Update = 0;
  List<int> solution_positions = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  int row_start;
  int column_start;
  int row_end = 0;
  int column_end = 0;
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

  int _seconds = 0;
  int _minutes =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
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
                        .width / 9 && local.dx < MediaQuery
                    .of(context)
                    .size
                    .width / 18.4 + (column + 1) * MediaQuery
                    .of(context)
                    .size
                    .width / 9

                    && local.dy > MediaQuery
                        .of(context)
                        .size
                        .height / 3.732 + row * MediaQuery
                        .of(context)
                        .size
                        .height / 15 && local.dy < MediaQuery
                    .of(context)
                    .size
                    .height / 3.732 + (row + 1) * MediaQuery
                    .of(context)
                    .size
                    .height / 15) {
                  end_Of_Selection_dx = MediaQuery
                      .of(context)
                      .size
                      .width / 18.4 + (column + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .width / 9;
                  end_Of_Selection_dy = MediaQuery
                      .of(context)
                      .size
                      .height / 3.732 + (row + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .height / 15;
                  if(row_end!=row || column_end!=column){
                    audioPlayer.play('sounds/selectionsound.wav');
                  }
                  row_end=row;
                  column_end=column;
                  if(init_Pan_Update!=0) {
                    points.removeAt(2*number_Of_Words_Selected + 1);
                  }init_Pan_Update=1;
                  setState(() {
                    points.add(DrawingPoints(
                      radius: MediaQuery
                          .of(context)
                          .size
                          .height / 15,
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
                            .height / 15,
                    ));
                    count=-1;
                  });
                }
              }
            }

          },
          onPanStart: (details) {
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
                          .width / 9 && local.dx < MediaQuery
                      .of(context)
                      .size
                      .width / 18.4 + (column + 1) * MediaQuery
                      .of(context)
                      .size
                      .width / 9

                      && local.dy > MediaQuery
                          .of(context)
                          .size
                          .height / 3.732 + row * MediaQuery
                          .of(context)
                          .size
                          .height / 15 && local.dy < MediaQuery
                      .of(context)
                      .size
                      .height / 3.732 + (row + 1) * MediaQuery
                      .of(context)
                      .size
                      .height / 15) {
                    audioPlayer.play('sounds/selectionsound.wav');
                    setState(() {
                      start_Of_Selection_dx=MediaQuery
                          .of(context)
                          .size
                          .width / 18.4 +
                          (column + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .width / 9;
                      start_Of_Selection_dy=MediaQuery
                          .of(context)
                          .size
                          .height / 3.732 +
                          (row + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .height / 15;

                      row_start=row;
                      column_start=column;
                      points.add(DrawingPoints(
                        radius: MediaQuery
                            .of(context)
                            .size
                            .height / 15,
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
                              .height / 15,


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

    onPanEnd: (details) {
    bool found_word = false;
    for (int i = 0; i < words.length; i++) {
    if (
    row_start == solution_positions[4 * i] &&
    column_start == solution_positions[4 * i + 1] &&
    row_end == solution_positions[4 * i + 2] &&
    column_end == solution_positions[4 * i + 3]
    ||
    row_start == solution_positions[4 * i + 2] &&
    column_start == solution_positions[4 * i + 3] &&
    row_end == solution_positions[4 * i] &&
    column_end == solution_positions[4 * i + 1]) {
    found_word = true;
    audioPlayer.play('sounds/foundsound.wav');
    number_Of_Words_Selected++;
    if ((row_one == row_start && column_one == column_start) ||
    (row_one == row_end && column_one == column_end)) {
    setState(() {
    word_one_scratch = true;
    });
    } else
    if ((row_two == row_start && column_two == column_start) ||
    (row_two == row_end && column_two == column_end)) {
    setState(() {
    word_two_scratch = true;
    });
    } else if ((row_three == row_start &&
    column_three == column_start) ||
    (row_three == row_end && column_three == column_end)) {
    setState(() {
    word_three_scratch = true;
    });
    } else
    if ((row_four == row_start && column_four == column_start) ||
    (row_four == row_end && column_four == column_end)) {
    setState(() {
    word_four_scratch = true;
    });
    } else {
    setState(() {
    word_five_scratch = true;
    });
    }
    }
    }
    if (!found_word) {
    points.removeAt(2 * number_Of_Words_Selected + 1);
    points.removeAt(2 * number_Of_Words_Selected);
    audioPlayer.play('sounds/wrongsound.wav');
    }
    if (word_one_scratch == true && word_two_scratch == true &&
    word_three_scratch == true && word_four_scratch == true &&
    word_five_scratch == true) {
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
    fisrt_Point_drawed = false;
    },


          child: CustomPaint(
            size: Size.infinite,
            foregroundPainter: DrawingPainter(
              pointsList: points,
            ),
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
                            .width / 10),
                        Text(AppLocalizations.of(context).translate("game_level_easy"),
                          style: TextStyle(fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 25,
                            color: Colors.white,),
                        ),
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 10),
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height / 25),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 8 / 10 * 1.1,
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(
                                  write_Puzzle_Letter(),
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 35,fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(
                                  write_Puzzle_Letter(),
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 35,fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(
                                  write_Puzzle_Letter(),
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 35,fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(
                                  write_Puzzle_Letter(),
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 35,fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(
                                  write_Puzzle_Letter(),
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 35,fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                          ],
                        ),

                        TableRow(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(
                                  write_Puzzle_Letter(),
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 35,fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(
                                  write_Puzzle_Letter(),
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 35,fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(
                                  write_Puzzle_Letter(),
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 35,fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child: Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),

                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 10 * 1.1,
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 15,
                              alignment: Alignment.center,
                              child:
                              Text(write_Puzzle_Letter(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 35,fontWeight: FontWeight.bold),),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,

                        boxShadow: [
                          BoxShadow(
                              color: GameColors.button_Background_Light,
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height / 25),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 3 / 5,
                    child: Table(
                        children: [
                          TableRow(children: [
                            Row(children: [
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 13),
                              (word_one_scratch && sorted_Num_Words == 4) ||
                                  (word_two_scratch && sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch && sorted_Num_Words == 3)
                                  ? Center(
                                  child: Text(return_Sorted_Words() + ', ',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ))
                                  : Center(
                                child: Text(return_Sorted_Words() + ',',
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 30,fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),),
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 15),
                              (word_one_scratch && sorted_Num_Words == 4) ||
                                  (word_two_scratch && sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch && sorted_Num_Words == 3)
                                  ? Text(return_Sorted_Words(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                                  : Text(return_Sorted_Words(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ]
                            ),
                          ]),


                          TableRow(children: [
                            Row(children: [
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 13),
                              (word_one_scratch && sorted_Num_Words == 4) ||
                                  (word_two_scratch && sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch && sorted_Num_Words == 3)
                                  ? Center(
                                  child: Text(return_Sorted_Words() + ', ',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ))
                                  : Center(
                                child: Text(return_Sorted_Words() + ',',
                                  style: TextStyle(fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 30,fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),),
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 15),
                              (word_one_scratch && sorted_Num_Words == 4) ||
                                  (word_two_scratch && sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch && sorted_Num_Words == 3)
                                  ? Center(child: Text(return_Sorted_Words(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),)
                                  : Center(child: Text(return_Sorted_Words(),
                                style: TextStyle(fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 30,fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),),
                            ]
                            ),
                          ]
                          ),

                          TableRow(children: [
                            Column(
                                children: [
                                  (word_one_scratch && sorted_Num_Words == 4) ||
                                      (word_two_scratch &&
                                          sorted_Num_Words == 0) ||
                                      (word_three_scratch &&
                                          sorted_Num_Words == 1) ||
                                      (word_four_scratch &&
                                          sorted_Num_Words == 2) ||
                                      (word_five_scratch &&
                                          sorted_Num_Words == 3) ? Text(
                                    return_Sorted_Words(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ) : Text(return_Sorted_Words(),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
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
                            color: GameColors.button_Background_Light,
                            spreadRadius: MediaQuery
                                .of(context)
                                .size
                                .height / 100),

                      ],
                      borderRadius: BorderRadius.circular(MediaQuery
                          .of(context)
                          .size
                          .height / 30),
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

    return letters[random.nextInt(26)];
  }



  create_Puzzle_Random() {
    if (count == -2) {
      count++;
      set_language();
      for (int i = 0; i < num_rows_and_columns * num_rows_and_columns; i++) {
        puzzle[i] = write_Random_Letter();
      }
      pick_Random_Words();
      write_Puzzle_Words(
          puzzle, words[0], words[1], words[2], words[3], words[4]);
      sorted_Num_Words = random.nextInt(5) - 1;
      next_Color=random.nextInt(5);
    }
  }

  String return_Sorted_Words() {
    sorted_Num_Words++;
    if (sorted_Num_Words == 5) {
      sorted_Num_Words = 0;
    }
    return words[sorted_Num_Words];
  }

  String write_Puzzle_Letter() {
    create_Puzzle_Random();
    count++;
    if (count == num_rows_and_columns * num_rows_and_columns) {
      count = 0;
    }
    return puzzle[count];
  }
  pick_Random_Words() {
    Random random = new Random();
    int one = random.nextInt(25);
    int two = random.nextInt(25);
    int three = random.nextInt(25);
    int four = random.nextInt(25);
    int five = random.nextInt(25);
    while ((all[one].length!=4 && all[one].length!=5)||(all[two].length!=4 && all[two].length!=5)||all[three].length != 4 || all[four].length !=4 || all[five].length != 4 || one==two||one==three||one==four||one==five||two==three||two==four||two==five ||three==four||three==five||four==five) {
      one = random.nextInt(25);
      two = random.nextInt(25);
      three = random.nextInt(25);
      four = random.nextInt(25);
      five = random.nextInt(25);
    }
    words[0] = all[one].toUpperCase();
    words[1] = all[two].toUpperCase();
    words[2] = all[three].toUpperCase();
    words[3] = all[four].toUpperCase();
    words[4] = all[five].toUpperCase();
  }



  Color serie_Color() {
    next_Color++;
    if(next_Color==5){
      next_Color=0;
    }
    selected_color = colors[next_Color];
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
    int old_best_time_minutes = (prefs.getInt('best_time_easy_minutes') ?? null);
    int old_best_time_seconds=(prefs.getInt('best_time_easy_seconds') ?? null);
    int old_time;
    if(old_best_time_minutes==null ||old_best_time_seconds==null){
    old_time=0;
    }else {
      old_time = old_best_time_minutes * 60 + old_best_time_seconds;
    }
    if(time_now<old_time || old_time==0){
      await prefs.setInt('best_time_easy_minutes', _minutes);
      await prefs.setInt('best_time_easy_seconds', _seconds);
      String best_time=_stringDuration(Duration(seconds:60*_minutes+_seconds));
      prefs.setString('best_time_easy', best_time);
      Navigator.of(context).pushNamed("/stats");
    }
  }
  write_Puzzle_Words(List<String> puzzle, String word_one, String word_two,
      String word_three, String word_four, String word_five) {

    // the row and column from the 'beginer of the words', rigth is positive and down is positive, later the word can be changed to reversed order so it makes more difficult the puzzle
    row_one = random.nextInt(num_rows_and_columns);
    column_one = random.nextInt(num_rows_and_columns - word_one.length + 1);
    row_two = random.nextInt(num_rows_and_columns);
    column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
    row_three = random.nextInt(num_rows_and_columns - word_three.length + 1);
    column_three = random.nextInt(num_rows_and_columns);
    row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);
    column_four = random.nextInt(num_rows_and_columns);

    int num_of_tentatives;

    //zero is word five diagonal, 1 is word five horizontal or vertical
    if (random.nextInt(2)==0) {
      //  zero is diagonal direciton SO, one is diagonal in direction SE
      if (random.nextInt(2)==0) {
        row_five = random.nextInt(num_rows_and_columns - word_five.length + 1);
        column_five =  random.nextInt(num_rows_and_columns - word_five.length + 1);

        int k=0;
        while(k<word_five.length*word_one.length) {
          k = 0;
          row_one =random.nextInt(num_rows_and_columns - word_five.length + 1);
          column_one = random.nextInt(num_rows_and_columns - word_one.length + 1);
          for (int i = 0; i < word_five.length; i++) {
            for (int j = 0; j < word_one.length; j++) {
              if (!(row_five + i == row_one &&
                  column_five + i == column_one + j)) {
                k++;
              }
            }
          }
        }
        k=0;
        while(k<word_five.length*word_two.length){
          k=0;
          row_two = random.nextInt(num_rows_and_columns);
          column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
          for(int i=0;i<word_five.length;i++){
            for(int j=0;j<word_two.length;j++){
              if(!(row_two==row_one||(row_five+i==row_two && column_five+i==column_two+j))){
                k++;
              }
            }
          }
        }
        num_of_tentatives=0;
        k=0;
        while(k<word_five.length*word_three.length){
          k=0;
          row_three = random.nextInt(num_rows_and_columns - word_three.length + 1);
          column_three = random.nextInt(num_rows_and_columns);
          num_of_tentatives++;
          if(num_of_tentatives>100){
            write_Puzzle_Words(puzzle, word_one, word_two, word_three, word_four, word_five);
          }
          for(int i=0;i<word_five.length;i++){
            for(int j=0;j<word_three.length;j++){
              if(!((row_five+i==row_three+j && column_five+i==column_three)||((row_three<=row_one&& row_three+word_three.length-1>=row_one)&&(column_three>=column_one && column_three<=column_one+word_one.length-1))||((row_three<=row_two&& row_three+word_three.length-1>=row_two)&&(column_three>=column_two && column_three<=column_two+word_two.length-1)))){
                k++;
              }
            }
          }
        }
        num_of_tentatives=0;
        k=0;
        while(k<word_five.length*word_four.length){
          k=0;
          row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);
          column_four = random.nextInt(num_rows_and_columns);
          num_of_tentatives++;
          if(num_of_tentatives>100){
            write_Puzzle_Words(puzzle, word_one, word_two, word_four, word_four, word_five);
          }
          for(int i=0;i<word_five.length;i++){
            for(int j=0;j<word_four.length;j++){
              if(!(column_four==column_three||((row_five+i==row_four+j && column_five+i==column_four)||((row_four<=row_one&& row_four+word_four.length-1>=row_one)&&(column_four>=column_one && column_four<=column_one+word_one.length-1))||((row_four<=row_two&& row_four+word_four.length-1>=row_two)&&(column_four>=column_two && column_four<=column_two+word_two.length-1))))){
                k++;
              }
            }
          }
        }


        if (random.nextInt(2) == 0) {
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
        solution_positions[16] = row_five;
        solution_positions[17] = column_five;
        solution_positions[18] = row_five + word_five.length - 1;
        solution_positions[19] = column_five + word_five.length - 1;
      } else {
        row_five = random.nextInt(num_rows_and_columns - word_five.length + 1);
        column_five = num_rows_and_columns - 1 -
            random.nextInt(num_rows_and_columns - word_five.length + 1);
        int k=0;
        while(k<word_five.length*word_one.length) {
          k = 0;
          row_one =random.nextInt(num_rows_and_columns - word_five.length + 1);
          column_one = random.nextInt(num_rows_and_columns - word_one.length + 1);
          for (int i = 0; i < word_five.length; i++) {
            for (int j = 0; j < word_one.length; j++) {
              if (!(row_five + i == row_one &&
                  column_five - i == column_one + j)) {
                k++;
              }
            }
          }
        }
        k=0;
        while(k<word_five.length*word_two.length){
          k=0;
          row_two = random.nextInt(num_rows_and_columns);
          column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
          for(int i=0;i<word_five.length;i++){
            for(int j=0;j<word_two.length;j++){
              if(!(row_two==row_one||(row_five+i==row_two && column_five-i==column_two+j))){
                k++;
              }
            }
          }
        }
        num_of_tentatives=0;
        k=0;
        while(k<word_five.length*word_three.length){
          k=0;
          row_three = random.nextInt(num_rows_and_columns - word_three.length + 1);
          column_three = random.nextInt(num_rows_and_columns);
          num_of_tentatives++;
          if(num_of_tentatives>100){
            write_Puzzle_Words(puzzle, word_one, word_two, word_three, word_four, word_five);
          }
          for(int i=0;i<word_five.length;i++){
            for(int j=0;j<word_three.length;j++){
              if(!((row_five+i==row_three+j && column_five-i==column_three)||((row_three<=row_one&& row_three+word_three.length-1>=row_one)&&(column_three>=column_one && column_three<=column_one+word_one.length-1))||((row_three<=row_two&& row_three+word_three.length-1>=row_two)&&(column_three>=column_two && column_three<=column_two+word_two.length-1)))){
                k++;
              }
            }
          }
        }
        num_of_tentatives=0;
        k=0;
        while(k<word_five.length*word_four.length){
          k=0;
          row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);
          column_four = random.nextInt(num_rows_and_columns);
          num_of_tentatives++;
          if(num_of_tentatives>100){
            write_Puzzle_Words(puzzle, word_one, word_two, word_four, word_four, word_five);
          }
          for(int i=0;i<word_five.length;i++){
            for(int j=0;j<word_four.length;j++){
              if(!(column_four==column_three||((row_five+i==row_four+j && column_five-i==column_four)||((row_four<=row_one&& row_four+word_four.length-1>=row_one)&&(column_four>=column_one && column_four<=column_one+word_one.length-1))||((row_four<=row_two&& row_four+word_four.length-1>=row_two)&&(column_four>=column_two && column_four<=column_two+word_two.length-1))))){
                k++;
              }
            }
          }
        }
        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five - i] =
            word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five - i] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16] = row_five;
        solution_positions[17] = column_five;
        solution_positions[18] = row_five + word_five.length - 1;
        solution_positions[19] = column_five - word_five.length + 1;
      }
    } else {
      if (random.nextInt(2) == 0) {
        row_five = random.nextInt(num_rows_and_columns);
        column_five =
            random.nextInt(num_rows_and_columns - word_five.length + 1);
        while (row_five == row_one || row_five == row_two ||
            row_one == row_two) {
          row_one = random.nextInt(num_rows_and_columns);
          row_two = random.nextInt(num_rows_and_columns);
          row_five = random.nextInt(num_rows_and_columns);
          column_one =
              random.nextInt(num_rows_and_columns - word_one.length + 1);
          column_two =
              random.nextInt(num_rows_and_columns - word_two.length + 1);
          column_five =
              random.nextInt(num_rows_and_columns - word_five.length + 1);
        }
        while ((column_three >= column_one &&
            column_three <= column_one + word_one.length - 1 &&
            row_three <= row_one &&
            row_three + word_three.length - 1 >= row_one) ||
            (column_three >= column_two &&
                column_three <= column_two + word_two.length - 1 &&
                row_three <= row_two &&
                row_three + word_three.length - 1 >= row_two) ||
            (column_three >= column_five &&
                column_three <= column_five + word_five.length - 1 &&
                row_three <= row_five &&
                row_three + word_three.length - 1 >= row_five)) {
          column_three = random.nextInt(num_rows_and_columns);
          row_three =
              random.nextInt(num_rows_and_columns - word_three.length + 1);
        }
        while ((column_four >= column_one &&
            column_four <= column_one + word_one.length - 1 &&
            row_four <= row_one &&
            row_four + word_four.length - 1 >= row_one) ||
            (column_four >= column_two &&
                column_four <= column_two + word_two.length - 1 &&
                row_four <= row_two &&
                row_four + word_four.length - 1 >= row_two) ||
            (column_four >= column_five &&
                column_four <= column_five + word_five.length - 1 &&
                row_four <= row_five &&
                row_four + word_four.length - 1 >= row_five) ||
            column_four == column_three) {
          column_four = random.nextInt(num_rows_and_columns);
          row_four =
              random.nextInt(num_rows_and_columns - word_four.length + 1);
        }

        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[row_five * num_rows_and_columns + i + column_five] =
            word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[row_five * num_rows_and_columns + i + column_five] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16] = row_five;
        solution_positions[17] = column_five;
        solution_positions[18] = row_five;
        solution_positions[19] = column_five + word_five.length - 1;
      } else {
        row_five = random.nextInt(num_rows_and_columns - word_five.length);
        column_five = random.nextInt(num_rows_and_columns);
        while (row_one == row_two) {
          row_one = random.nextInt(num_rows_and_columns);
          row_two = random.nextInt(num_rows_and_columns);
          column_one =
              random.nextInt(num_rows_and_columns - word_one.length + 1);
          column_two =
              random.nextInt(num_rows_and_columns - word_two.length + 1);
        }
        while ((column_three >= column_one &&
            column_three <= column_one + word_one.length - 1 &&
            row_three <= row_one &&
            row_three + word_three.length - 1 >= row_one) ||
            (column_three >= column_two &&
                column_three <= column_two + word_two.length - 1 &&
                row_three <= row_two &&
                row_three + word_three.length - 1 >= row_two)) {
          column_three = random.nextInt(num_rows_and_columns);
          row_three =
              random.nextInt(num_rows_and_columns - word_three.length + 1);
        }
        while ((column_four >= column_one &&
            column_four <= column_one + word_one.length - 1 &&
            row_four <= row_one &&
            row_four + word_four.length - 1 >= row_one) ||
            (column_four >= column_two &&
                column_four <= column_two + word_two.length - 1 &&
                row_four <= row_two &&
                row_four + word_four.length - 1 >= row_two) ||
            column_three == column_four) {
          column_four = random.nextInt(num_rows_and_columns);
          row_four =
              random.nextInt(num_rows_and_columns - word_four.length + 1);
        }
        while ((column_five >= column_one &&
            column_five <= column_one + word_one.length - 1 &&
            row_five <= row_one &&
            row_five + word_five.length - 1 >= row_one) ||
            (column_five >= column_two &&
                column_five <= column_two + word_two.length - 1 &&
                row_five <= row_two &&
                row_five + word_five.length - 1 >= row_two) ||
            column_three == column_five || column_four == column_five) {
          column_five = random.nextInt(num_rows_and_columns);
          row_five =
              random.nextInt(num_rows_and_columns - word_five.length + 1);
        }
        if (random.nextInt(2) == 0) {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five] =
            word_five[i];
          }
        } else {
          for (int i = 0; i < word_five.length; i++) {
            puzzle[(row_five + i) * num_rows_and_columns + column_five] =
            word_five[word_five.length - 1 - i];
          }
        }
        solution_positions[16] = row_five;
        solution_positions[17] = column_five;
        solution_positions[18] = row_five + word_five.length - 1;
        solution_positions[19] = column_five;
      }
    }
    // now it just needs to write  the letters in the list string puzzle which in two possible ways original order or reverse order
    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * num_rows_and_columns + i + column_one] = word_one[i];
      }
    } else {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * num_rows_and_columns + i + column_one] =
        word_one[word_one.length - 1 - i];
      }
    }
    if (random.nextInt(2) == 0) {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * num_rows_and_columns + i + column_two] = word_two[i];
      }
    } else {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * num_rows_and_columns + i + column_two] =
        word_two[word_two.length - 1 - i];
      }
    }

    if (random.nextInt(2) == 0) {
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
    if (random.nextInt(2) == 0) {
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
    solution_positions[0] = row_one;
    solution_positions[1] = column_one;
    solution_positions[2] = row_one;
    solution_positions[3] = column_one + word_one.length - 1;
    solution_positions[4] = row_two;
    solution_positions[5] = column_two;
    solution_positions[6] = row_two;
    solution_positions[7] = column_two + word_two.length - 1;
    solution_positions[8] = row_three;
    solution_positions[9] = column_three;
    solution_positions[10] = row_three + word_three.length - 1;
    solution_positions[11] = column_three;
    solution_positions[12] = row_four;
    solution_positions[13] = column_four;
    solution_positions[14] = row_four + word_four.length - 1;
    solution_positions[15] = column_four;
  }
set_language(){
    String language=AppLocalizations.of(context).translate("game_language");
    if(language=='en'){
      all=[
        "acid",
        "area",
        "baby",
        "apps",
        "ball",
        "bank",
        "cake",
        "boys",
        "care",

        "club",
        "code",
        "cute",
        "crew",
        "deal",
        "diet",
        "dogs",
        "exam",
        "eyes",
        "feet",

        "adult",
        "album",
        "agent",
        "angle",
        "apple",
        "blood",
      ];
    }else if (language=='pt'){
      all=[
        "área" ,
        "bebê" ,
        "bola",
        "banco",
        "bolo",

        "clube",
        "exame",
        "olhos",
        "album",
         "maçã" ,

        "amor",
        "fato",
        "tolo",
        "medo",
        "vida" ,

        "casa",
        "cela",
        "base",
        "alta",
        "frio" ,

        "alma",
        "luta",
        "nada",
        "selo",
        "pneu" ,
      ];
    }else if(language=='fr'){
      all=[

        "acide",
        "zone" ,
        "bebe" ,
        "Balle" ,

        "club" ,
        "code",
        "deal",
        "yeux" ,

        "APAX" ,
        "MIXE",
        "AXEE",
        "FIXE" ,

        "BOXE" ,
        "TAXE",
        "EXIL",
        "DOUX" ,

        "FOXE" ,
        "EXAM",
        "EXIT",
        "PRIX" ,

        "pieds" ,
        "album",
        "agent",
        "angle" ,
        "Pomme" ,
      ];
    }else if (language=='es'){
      all=[
        "acido",
        "zona" ,
        "bebé",
        "banco",
        "club",
        "lindo" ,
        "dieta",
        "ojos",
        "pies",
        "album",

        "DUDE",
        "ECHO" ,
        "ERRE",
        "FAMA",
        "COXA",
        "CAGO" ,
        "BOIL",
        "BOZO",
        "CHIP",
        "CAMA",

        "CAOS",
        "CAIS" ,
        "CEBO",
        "ABES",
        "ALUD",
      ];
    }
}
}