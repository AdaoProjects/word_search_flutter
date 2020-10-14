import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:findthewords/custom_painter.dart';
import 'package:findthewords/main.dart';
import 'package:findthewords/utilites/puzzles_game_medium_en.dart';
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
  bool created_puzzle = false;


  Random random = new Random();
  List<String> words = ['', '', '', '', '', '', '', '', '', '', '', '', '', '', ''];
  int num_rows_and_columns = 10;

  bool word_one_scratch = false;
  bool word_two_scratch = false;
  bool word_three_scratch = false;
  bool word_four_scratch = false;
  bool word_five_scratch = false;
  bool word_six_scratch = false;
  bool word_seven_scratch = false;
  bool word_eight_scratch = false;
  bool word_nine_scratch = false;
  bool word_ten_scratch = false;
  bool word_eleven_scratch = false;
  bool word_twelve_scratch = false;
  bool word_thirteenth_scratch = false;
  bool word_fourteenth_scratch=false;
  bool word_fifteenth_scratch=false;




  int sorted_Num_Words;

//Paint
  bool first_Point_Drawed = false;
  int number_Of_Words_Selected = 0;
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
  int next_Color = 0;

  //Timer
  int _seconds = 0;
  int _minutes = 0;

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
                    .width / 18.415
                    + column * MediaQuery
                        .of(context)
                        .size
                        .width / 11.21 && local.dx < MediaQuery
                    .of(context)
                    .size
                    .width / 18.415 + (column + 1) * MediaQuery
                    .of(context)
                    .size
                    .width / 11.21

                    && local.dy > MediaQuery
                        .of(context)
                        .size
                        .height / 3.87 + row * MediaQuery
                        .of(context)
                        .size
                        .height / 18.75 && local.dy < MediaQuery
                    .of(context)
                    .size
                    .height / 3.87 + (row + 1) * MediaQuery
                    .of(context)
                    .size
                    .height / 18.75) {
                  end_Of_Selection_dx = MediaQuery
                      .of(context)
                      .size
                      .width / 18.415 + (column + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .width / 11.21;
                  end_Of_Selection_dy = MediaQuery
                      .of(context)
                      .size
                      .height / 3.87 + (row + 1 / 2) * MediaQuery
                      .of(context)
                      .size
                      .height / 18.75;
                  if (row_end != row || column_end != column) {
                    play_Selection_Sound();
                  }
                  row_end = row;
                  column_end = column;
                  if (!first_Point_Drawed) {
                    points.removeAt(2 * number_Of_Words_Selected + 1);
                  }
                  first_Point_Drawed = false;
                  setState(() {
                    points.add(DrawingPoints(
                      radius: MediaQuery
                          .of(context)
                          .size
                          .height / 18.75,
                      first: false,
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
                  });
                }
              }
            }
          },
          onPanStart: (details) {
            RenderBox box = context.findRenderObject();
            if (!first_Point_Drawed) {
              final Offset local = box.globalToLocal(
                  details.globalPosition);
              for (int row = 0; row < num_rows_and_columns; row++) {
                for (int column = 0; column < num_rows_and_columns; column++) {
                  if (local.dx > MediaQuery
                      .of(context)
                      .size
                      .width / 18.415
                      + column * MediaQuery
                          .of(context)
                          .size
                          .width / 11.21 && local.dx < MediaQuery
                      .of(context)
                      .size
                      .width / 18.415 + (column + 1) * MediaQuery
                      .of(context)
                      .size
                      .width / 11.21

                      && local.dy > MediaQuery
                          .of(context)
                          .size
                          .height / 3.87 + row * MediaQuery
                          .of(context)
                          .size
                          .height / 18.75 && local.dy < MediaQuery
                      .of(context)
                      .size
                      .height / 3.87 + (row + 1) * MediaQuery
                      .of(context)
                      .size
                      .height / 18.75) {
                    play_Selection_Sound();

                    setState(() {
                      start_Of_Selection_dx = MediaQuery
                          .of(context)
                          .size
                          .width / 18.415 +
                          (column + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .width / 11.21;
                      start_Of_Selection_dy = MediaQuery
                          .of(context)
                          .size
                          .height / 3.87 +
                          (row + 1 / 2) * MediaQuery
                              .of(context)
                              .size
                              .height / 18.75;

                      row_start = row;
                      column_start = column;
                      points.add(DrawingPoints(
                        radius: MediaQuery
                            .of(context)
                            .size
                            .height / 18.75,
                        first: true,
                        points: Offset(
                            start_Of_Selection_dx, start_Of_Selection_dy),
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
                    });
                  }
                }
              }
            }
            first_Point_Drawed = true;
          },
          onPanEnd: (details)  {
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
                play_Found_Sound();
                number_Of_Words_Selected++;
                if (i == 0) {
                  if (word_one_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_one_scratch = true;
                  });
                } else if (i == 1) {
                  if (word_two_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_two_scratch = true;
                  });
                } else if (i == 2) {
                  if (word_three_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_three_scratch = true;
                  });
                } else if (i == 3) {
                  if (word_four_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_four_scratch = true;
                  });
                } else if (i == 5) {
                  if (word_six_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_six_scratch = true;
                  });
                } else if (i == 6) {
                  if (word_seven_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_seven_scratch = true;
                  });
                } else if (i == 7) {
                  if (word_eight_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_eight_scratch = true;
                  });
                } else if (i == 8) {
                  if (word_nine_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_nine_scratch = true;
                  });
                } else if (i == 9) {
                  if (word_ten_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_ten_scratch = true;
                  });
                } else if (i == 10) {
                  if (word_eleven_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_eleven_scratch = true;
                  });
                } else if (i == 11) {
                  if (word_twelve_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_twelve_scratch = true;
                  });
                }
                else if (i == 12) {
                  if (word_thirteenth_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_thirteenth_scratch = true;
                  });
                }
                else if (i == 13) {
                  if (word_fourteenth_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_fourteenth_scratch = true;
                  });
                }
                else if (i == 14) {
                  if (word_fifteenth_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_fifteenth_scratch = true;
                  });
                }
                else {
                  if (word_five_scratch == true) {
                    number_Of_Words_Selected--;
                    found_word = false;
                  }
                  setState(() {
                    word_five_scratch = true;
                  });
                }
              }
            }
            if (!found_word) {
              points.removeAt(2 * number_Of_Words_Selected + 1);
              points.removeAt(2 * number_Of_Words_Selected);
              play_Wrong_Sound();
            }
            if (word_one_scratch == true && word_two_scratch == true &&
                word_three_scratch == true && word_four_scratch == true &&
                word_five_scratch == true && word_six_scratch == true &&
                word_seven_scratch == true && word_eight_scratch == true
                && word_nine_scratch == true && word_ten_scratch == true &&
                word_eleven_scratch == true && word_twelve_scratch == true&&
                word_thirteenth_scratch==true && word_fourteenth_scratch==true &&
                word_fifteenth_scratch==true) {
              set_Best_Time();
              show_Congrats();
            }
          },

          child: CustomPaint(
            size: Size.infinite,
            foregroundPainter: DrawingPainter(
              pointsList: points,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      children:[
                        SizedBox(width:MediaQuery.of(context).size.width/5),
                        Icon(Icons.star,
                            color: GameColors.secondary,
                            size:MediaQuery.of(context).size.width/10),
                        SizedBox(width:MediaQuery.of(context).size.width/10),
                        Icon(
                          Icons.star,
                          color: GameColors.secondary,
                          size: MediaQuery
                              .of(context)
                              .size
                              .height / 8,
                        ),
                        SizedBox(width:MediaQuery.of(context).size.width/10),
                        Icon(Icons.star,
                            color: GameColors.secondary,
                            size:MediaQuery.of(context).size.width/10),
                      ]
                  ),
                  Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width / 15),
                        Text(AppLocalizations.of(context).translate(
                            "game_level_medium"),
                          style: TextStyle(fontSize: MediaQuery
                              .of(context)
                              .size
                              .height / 25,
                            color: Colors.white,),
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height / 25),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width*9/10,
                    child: Table(
                        children: [
                          for (int i = 0; i <
                              num_rows_and_columns; i++) TableRow(
                            children: [
                              for (int j = 0; j < num_rows_and_columns; j++ )
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 12 * 1.1,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 18.75,
                                  alignment: Alignment.center,
                                  child:
                                  Text(write_Puzzle_Letter(
                                      num_rows_and_columns * i + j),
                                    style: TextStyle(fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 35,
                                        fontWeight: FontWeight.bold),),

                                ),
                            ],
                          ),
                        ]
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                            color: GameColors.primary,
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
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height / 25),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1.5,
                    child: Table(
                        children: [
                          for (int i=0; i<3;i++) TableRow(children: [
                            Row(children: [
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 13),
                              (word_fifteenth_scratch && sorted_Num_Words==13)
                                  || (word_fourteenth_scratch && sorted_Num_Words==12)
                                  ||(word_thirteenth_scratch && sorted_Num_Words==11)
          ||(word_twelve_scratch &&
                                  sorted_Num_Words == 10) ||
                                  (word_eleven_scratch &&
                                      sorted_Num_Words == 9)
                                  || (word_ten_scratch &&
                                  sorted_Num_Words == 8) ||
                                  (word_nine_scratch &&
                                      sorted_Num_Words == 7) ||
                                  (word_eight_scratch &&
                                      sorted_Num_Words == 6) ||
                                  (word_seven_scratch &&
                                      sorted_Num_Words == 5) ||
                                  (word_six_scratch &&
                                      sorted_Num_Words == 4) ||
                                  (word_one_scratch &&
                                      sorted_Num_Words == 14) ||
                                  (word_two_scratch &&
                                      sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch &&
                                      sorted_Num_Words == 3)
                                  ? Center(
                                  child: Text(
                                    return_Sorted_Words() +
                                        ', ',
                                    style: TextStyle(
                                        decoration: TextDecoration
                                            .lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,
                                        fontWeight: FontWeight
                                            .bold,
                                        color: Colors.black),
                                  ))
                                  : Center(
                                child: Text(
                                  return_Sorted_Words() + ',',
                                  style: TextStyle(
                                      fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30,
                                      fontWeight: FontWeight
                                          .bold,
                                      color: Colors.black),
                                ),),
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 30),
                              (word_fifteenth_scratch && sorted_Num_Words==13)
                                  || (word_fourteenth_scratch && sorted_Num_Words==12)
                                  ||(word_thirteenth_scratch && sorted_Num_Words==11)
                                  ||(word_twelve_scratch &&
                                  sorted_Num_Words == 10) ||
                                  (word_eleven_scratch &&
                                      sorted_Num_Words == 9)
                                  || (word_ten_scratch &&
                                  sorted_Num_Words == 8) ||
                                  (word_nine_scratch &&
                                      sorted_Num_Words == 7) ||
                                  (word_eight_scratch &&
                                      sorted_Num_Words == 6) ||
                                  (word_seven_scratch &&
                                      sorted_Num_Words == 5) ||
                                  (word_six_scratch &&
                                      sorted_Num_Words == 4) ||
                                  (word_one_scratch &&
                                      sorted_Num_Words == 14) ||
                                  (word_two_scratch &&
                                      sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch &&
                                      sorted_Num_Words == 3)
                                  ? Center(
                                  child: Text(
                                    return_Sorted_Words() +
                                        ', ',
                                    style: TextStyle(
                                        decoration: TextDecoration
                                            .lineThrough,
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 30,
                                        fontWeight: FontWeight
                                            .bold,
                                        color: Colors.black),
                                  ))
                                  : Center(
                                child: Text(
                                  return_Sorted_Words() + ',',
                                  style: TextStyle(
                                      fontSize: MediaQuery
                                          .of(context)
                                          .size
                                          .height / 30,
                                      fontWeight: FontWeight
                                          .bold,
                                      color: Colors.black),
                                ),),
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 30),

                              (word_fifteenth_scratch && sorted_Num_Words==13)
                                  || (word_fourteenth_scratch && sorted_Num_Words==12)
                                  ||(word_thirteenth_scratch && sorted_Num_Words==11)
                                  ||(word_twelve_scratch &&
                                  sorted_Num_Words == 10) ||
                                  (word_eleven_scratch &&
                                      sorted_Num_Words == 9)
                                  || (word_ten_scratch &&
                                  sorted_Num_Words == 8) ||
                                  (word_nine_scratch &&
                                      sorted_Num_Words == 7) ||
                                  (word_eight_scratch &&
                                      sorted_Num_Words == 6) ||
                                  (word_seven_scratch &&
                                      sorted_Num_Words == 5) ||
                                  (word_six_scratch &&
                                      sorted_Num_Words == 4) ||
                                  (word_one_scratch &&
                                      sorted_Num_Words == 14) ||
                                  (word_two_scratch &&
                                      sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch &&
                                      sorted_Num_Words == 3)
                                  ? Center(child: Text(
                                return_Sorted_Words() + ',',
                                style: TextStyle(
                                    decoration: TextDecoration
                                        .lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),)
                                  : Center(child: Text(
                                return_Sorted_Words() + ',',
                                style: TextStyle(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              ),
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 30),
                              (word_fifteenth_scratch && sorted_Num_Words==13)
                                  || (word_fourteenth_scratch && sorted_Num_Words==12)
                                  ||(word_thirteenth_scratch && sorted_Num_Words==11)
                                  ||(word_twelve_scratch &&
                                  sorted_Num_Words == 10) ||
                                  (word_eleven_scratch &&
                                      sorted_Num_Words == 9)
                                  || (word_ten_scratch &&
                                  sorted_Num_Words == 8) ||
                                  (word_nine_scratch &&
                                      sorted_Num_Words == 7) ||
                                  (word_eight_scratch &&
                                      sorted_Num_Words == 6) ||
                                  (word_seven_scratch &&
                                      sorted_Num_Words == 5) ||
                                  (word_six_scratch &&
                                      sorted_Num_Words == 4) ||
                                  (word_one_scratch &&
                                      sorted_Num_Words == 14) ||
                                  (word_two_scratch &&
                                      sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch &&
                                      sorted_Num_Words == 3)
                                  ? Center(child: Text(
                                return_Sorted_Words() + ',',
                                style: TextStyle(
                                    decoration: TextDecoration
                                        .lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),)
                                  : Center(child: Text(
                                return_Sorted_Words() + ',',
                                style: TextStyle(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              ),
                              SizedBox(width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 30),
                              (word_fifteenth_scratch && sorted_Num_Words==13)
                                  || (word_fourteenth_scratch && sorted_Num_Words==12)
                                  ||(word_thirteenth_scratch && sorted_Num_Words==11)
                                  ||(word_twelve_scratch &&
                                  sorted_Num_Words == 10) ||
                                  (word_eleven_scratch &&
                                      sorted_Num_Words == 9)
                                  || (word_ten_scratch &&
                                  sorted_Num_Words == 8) ||
                                  (word_nine_scratch &&
                                      sorted_Num_Words == 7) ||
                                  (word_eight_scratch &&
                                      sorted_Num_Words == 6) ||
                                  (word_seven_scratch &&
                                      sorted_Num_Words == 5) ||
                                  (word_six_scratch &&
                                      sorted_Num_Words == 4) ||
                                  (word_one_scratch &&
                                      sorted_Num_Words == 14) ||
                                  (word_two_scratch &&
                                      sorted_Num_Words == 0) ||
                                  (word_three_scratch &&
                                      sorted_Num_Words == 1) ||
                                  (word_four_scratch &&
                                      sorted_Num_Words == 2) ||
                                  (word_five_scratch &&
                                      sorted_Num_Words == 3)
                                  ? Center(child: Text(
                                return_Sorted_Words(),
                                style: TextStyle(
                                    decoration: TextDecoration
                                        .lineThrough,
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),)
                                  : Center(child: Text(
                                return_Sorted_Words(),
                                style: TextStyle(
                                    fontSize: MediaQuery
                                        .of(context)
                                        .size
                                        .height / 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              ),
                            ]
                            ),
                          ]
                          ),
                        ]
                    ),


                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(MediaQuery
                          .of(context)
                          .size
                          .height / 30),
                    ),
                  ),
      ),
                ]
            ),
          ),
        ),
      ),

    );
  }



  create_Puzzle_Random() {
    if (!created_puzzle) {
      created_puzzle = true;
      int i =random.nextInt(1000);

      puzzle=PuzzlesGameMediumEN.all_puzzles_medium_en[i];
      solution_positions=PuzzlesGameMediumEN.all_solutions_medium_en[i];
      words=PuzzlesGameMediumEN.all_words_medium_en[i];
      sorted_Num_Words = random.nextInt(15) - 1;
      next_Color = random.nextInt(5);
    }
  }

  String return_Sorted_Words() {
    sorted_Num_Words++;
    if (sorted_Num_Words == 15) {
      sorted_Num_Words = 0;
    }
    return words[sorted_Num_Words].toUpperCase();
  }

  String write_Puzzle_Letter(int i) {
    if (i == 0) {
      create_Puzzle_Random();
    }
    return puzzle[0][i].toUpperCase();
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
    if (!word_one_scratch || !word_two_scratch || !word_three_scratch ||
        !word_five_scratch || !word_six_scratch || !word_seven_scratch||
        !word_eight_scratch||!word_nine_scratch||!word_ten_scratch||
        !word_eleven_scratch||!word_twelve_scratch||!word_thirteenth_scratch||
    !word_fourteenth_scratch || !word_fifteenth_scratch) {
      _seconds++;
      if (_seconds == 60) {
        _minutes++;
        _seconds = 0;
      }
      setState(() {});
    }
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
  show_Congrats() {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.pop(navigatorKey.currentState.overlay.context,);
      Navigator.pop(context);},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("You won"),
      content:  Text('Congratulations your time was '+_stringDuration(Duration(seconds: _seconds + 60 * _minutes))),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: navigatorKey.currentState.overlay.context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  play_Found_Sound () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("has_Sounds") == true) {
      audioPlayer.play('sounds/foundsound.wav');
    }
  }
  play_Wrong_Sound() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("has_Sounds") == true) {
      audioPlayer.play('sounds/wrongsound.wav');
    }
  }
  play_Selection_Sound() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("has_Sounds")==true) {
      audioPlayer.play('sounds/selectionsound.wav');
    }
  }
}