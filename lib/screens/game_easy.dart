import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:findthewords/utilites/colors.dart';
import 'package:findthewords/screens/levels.dart';
import 'package:findthewords/custom_painter.dart';
import 'package:findthewords/main.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:findthewords/app_localizations.dart';
AudioCache audioPlayer = AudioCache();
class Game_Easy extends StatefulWidget {
  Game_Type game_type;
  Game_Easy({Key key, @required this.game_type}) : super(key: key);
  @override
  _Game_EasyState createState() => _Game_EasyState();

}

class _Game_EasyState extends State<Game_Easy> with TickerProviderStateMixin {
  //Puzzle
  List<String> all;
  List<String> puzzle=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];

  bool created_puzzle=false;
  int no_connection_one_count=0;
  int no_connection_two_count=0;
  int no_connection_three_count=0;
  int no_connection_four_count=0;
  Random random = new Random();
  List<String> words = ['', '', '', '', '','','','',''];
  int num_rows_and_columns = 8;
  bool word_one_scratch = false;
  bool word_two_scratch = false;
  bool word_three_scratch = false;
  bool word_four_scratch = false;
  bool word_five_scratch = false;
  bool word_six_scratch = false;
  bool word_seven_scratch=false;
  bool word_eight_scratch=false;
  bool word_nine_scratch=false;
  bool word_one_reverse ;
  bool word_two_reverse ;
  bool word_three_reverse ;
  bool word_four_reverse ;
  bool word_five_reverse ;
  bool word_six_reverse ;
  bool word_seven_reverse;
  bool word_eight_reverse;
  bool word_nine_reverse;
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
  int row_nine;
  int column_nine;
  int sorted_Num_Words;

//Paint
  bool first_Point_Drawed = false;
  bool init_Pan_Update;
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
   return MaterialApp(
       debugShowCheckedModeBanner: false,
       home:Scaffold(
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
                       play_Selection_Sound();
                     }
                     row_end=row;
                     column_end=column;
                     if(!first_Point_Drawed) {
                       points.removeAt(2*number_Of_Words_Selected + 1);
                     }
                     first_Point_Drawed=false;
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
                     });
                   }
                 }
               }

             },
             onPanStart: (details)  async{
               RenderBox box = context.findRenderObject();
               if(!first_Point_Drawed) {
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

                       play_Selection_Sound();

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
                       });
                     }
                   }
                 }
               }
               first_Point_Drawed=true;
             },

             onPanEnd: (details) {
               bool found_word = false;
               for (int i = 0; i < words.length; i++) {
                 if (
                 (
                     row_start == solution_positions[4 * i] &&
                         column_start == solution_positions[4 * i + 1] &&
                         row_end == solution_positions[4 * i + 2] &&
                         column_end == solution_positions[4 * i + 3])
                     ||
                     (row_start == solution_positions[4 * i + 2] &&
                         column_start == solution_positions[4 * i + 3] &&
                         row_end == solution_positions[4 * i] &&
                         column_end == solution_positions[4 * i + 1])) {
                   found_word = true;
                   play_Found_Sound();
                   number_Of_Words_Selected++;
                   if (i==0) {
                     if(word_one_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);

                     }
                     setState(() {
                       word_one_scratch = true;
                     });

                   } else if (i==1) {
                     if(word_two_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);

                     }
                     setState(() {
                       word_two_scratch = true;
                     });
                   } else if (i==2) {
                     if(word_three_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);
                     }
                     setState(() {
                       word_three_scratch = true;
                     });
                   }
                   else if (i==3) {
                     if(word_four_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);

                     }
                     setState(() {
                       word_four_scratch = true;
                     });
                   } else if (i==5) {
                     if(word_six_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);

                     }
                     setState(() {
                       word_six_scratch = true;
                     });
                   }   else if (i==6) {
                     if(word_seven_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);

                     }
                     setState(() {
                       word_seven_scratch = true;
                     });
                   } else if (i==7) {
                     if(word_eight_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);

                     }
                     setState(() {
                       word_eight_scratch = true;
                     });
                   }  else if (i==8) {
                     if(word_nine_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);

                     }
                     setState(() {
                       word_nine_scratch = true;
                     });
                   } else {
                     if(word_five_scratch==true){
                       number_Of_Words_Selected--;
                       points.removeAt(2 * number_Of_Words_Selected + 1);
                       points.removeAt(2 * number_Of_Words_Selected);

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
                   word_five_scratch == true && word_six_scratch == true
               &&word_seven_scratch==true && word_eight_scratch==true&&
               word_nine_scratch==true) {
                 set_Best_Time();
                 setState(() {
                   showAlertDialog(context);
                 });

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
                     Image.asset('assets/images/find_the_words.png',
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
                           return_Timer(),


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
                           for (int i=0; i< num_rows_and_columns;i++) TableRow(
                             children: [
                               for (int j=0; j< num_rows_and_columns;j++ )
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
                                   Text(write_Puzzle_Letter(i*num_rows_and_columns+j),
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
                                 color: GameColors.primary,
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
                           .width * 5 / 6,
                       child: Table(
                           children: [
                             TableRow(children: [
                               Row(children: [
                                 SizedBox(width: MediaQuery
                                     .of(context)
                                     .size
                                     .width / 13),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
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
                                     .width / 30),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
                                     (word_two_scratch && sorted_Num_Words == 0) ||
                                     (word_three_scratch &&
                                         sorted_Num_Words == 1) ||
                                     (word_four_scratch &&
                                         sorted_Num_Words == 2) ||
                                     (word_five_scratch && sorted_Num_Words == 3)
                                     ? Center(child: Text(return_Sorted_Words()+',',
                                   style: TextStyle(
                                       decoration: TextDecoration.lineThrough,
                                       fontSize: MediaQuery
                                           .of(context)
                                           .size
                                           .height / 30,fontWeight: FontWeight.bold,
                                       color: Colors.black),
                                 ),)
                                     : Center(child: Text(return_Sorted_Words()+',',
                                   style: TextStyle(fontSize: MediaQuery
                                       .of(context)
                                       .size
                                       .height / 30,fontWeight: FontWeight.bold,
                                       color: Colors.black),
                                 ),
                                 ),
                                 SizedBox(width: MediaQuery
                                     .of(context)
                                     .size
                                     .width / 30),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
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
                                 ),
                                 ),
                               ]
                               ),
                             ]
                             ),


                             TableRow(children: [
                               Row(children: [
                                 SizedBox(width: MediaQuery
                                     .of(context)
                                     .size
                                     .width / 13),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
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
                                     .width / 30),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
                                     (word_two_scratch && sorted_Num_Words == 0) ||
                                     (word_three_scratch &&
                                         sorted_Num_Words == 1) ||
                                     (word_four_scratch &&
                                         sorted_Num_Words == 2) ||
                                     (word_five_scratch && sorted_Num_Words == 3)
                                     ? Center(child: Text(return_Sorted_Words()+',',
                                   style: TextStyle(
                                       decoration: TextDecoration.lineThrough,
                                       fontSize: MediaQuery
                                           .of(context)
                                           .size
                                           .height / 30,fontWeight: FontWeight.bold,
                                       color: Colors.black),
                                 ),)
                                     : Center(child: Text(return_Sorted_Words()+',',
                                   style: TextStyle(fontSize: MediaQuery
                                       .of(context)
                                       .size
                                       .height / 30,fontWeight: FontWeight.bold,
                                       color: Colors.black),
                                 ),
                                 ),
                                 SizedBox(width: MediaQuery
                                     .of(context)
                                     .size
                                     .width / 30),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
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
                                 ),
                                 ),
                               ]
                               ),
                             ]
                             ),

                             TableRow(children: [
                               Row(children: [
                                 SizedBox(width: MediaQuery
                                     .of(context)
                                     .size
                                     .width / 13),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
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
                                     .width / 30),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
                                     (word_two_scratch && sorted_Num_Words == 0) ||
                                     (word_three_scratch &&
                                         sorted_Num_Words == 1) ||
                                     (word_four_scratch &&
                                         sorted_Num_Words == 2) ||
                                     (word_five_scratch && sorted_Num_Words == 3)
                                     ? Center(child: Text(return_Sorted_Words()+',',
                                   style: TextStyle(
                                       decoration: TextDecoration.lineThrough,
                                       fontSize: MediaQuery
                                           .of(context)
                                           .size
                                           .height / 30,fontWeight: FontWeight.bold,
                                       color: Colors.black),
                                 ),)
                                     : Center(child: Text(return_Sorted_Words()+',',
                                   style: TextStyle(fontSize: MediaQuery
                                       .of(context)
                                       .size
                                       .height / 30,fontWeight: FontWeight.bold,
                                       color: Colors.black),
                                 ),
                                 ),
                                 SizedBox(width: MediaQuery
                                     .of(context)
                                     .size
                                     .width / 30),
                                 (word_nine_scratch && sorted_Num_Words == 7) ||
                                     (word_eight_scratch && sorted_Num_Words == 6) ||(word_seven_scratch && sorted_Num_Words == 5) ||
                                     (word_six_scratch && sorted_Num_Words == 4) ||(word_one_scratch && sorted_Num_Words == 8) ||
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
                   ]
               ),
             ),
           ),
         ),

       )
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
    if(!created_puzzle) {
      created_puzzle=true;
      set_language();
      for (int i = 0; i < num_rows_and_columns * num_rows_and_columns; i++) {
        puzzle[i] = write_Random_Letter();
      }
      fit_Words_Puzzle(
          puzzle,
          words[0],
          words[1],
          words[2],
          words[3],
          words[4],
          words[5],
      words[6],
      words[7],
      words[8]);
      write_Words_Puzzle(
          puzzle,
          words[0],
          words[1],
          words[2],
          words[3],
          words[4],
          words[5],
          words[6],
          words[7],
          words[8]);
      rotate_puzzle(
          puzzle,
          words[0],
          words[1],
          words[2],
          words[3],
          words[4],
          words[5],
          words[6],
    words[7],
    words[8]);
      sorted_Num_Words = random.nextInt(9) - 1;
      next_Color = random.nextInt(5);
    }
  }

  String return_Sorted_Words() {
    sorted_Num_Words++;
    if (sorted_Num_Words == 9) {
      sorted_Num_Words = 0;
    }
    return words[sorted_Num_Words];
  }

  String write_Puzzle_Letter(int i) {
    create_Puzzle_Random();
    return puzzle[i];
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
    if (!word_one_scratch || !word_two_scratch || !word_three_scratch ||
        !word_five_scratch || !word_six_scratch || !word_seven_scratch||!word_eight_scratch||!word_nine_scratch) {
      _seconds++;
      if (_seconds == 60) {
        _minutes++;
        _seconds = 0;
      }
      setState(() {});
    }
  }
  Text return_Timer() {

    Duration duration = Duration(seconds: _seconds + 60 * _minutes);
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
      prefs.setInt('best_time_easy_minutes', _minutes);
      prefs.setInt('best_time_easy_seconds', _seconds);
      String best_time=_stringDuration(Duration(seconds:60*_minutes+_seconds));
      prefs.setString('best_time_easy', best_time);
      Navigator.of(context).pushNamed("/stats");
    }
  }
  fit_Words_Puzzle(List<String> puzzle, String word_one, String word_two,
      String word_three, String word_four, String word_five, String word_six
      ,String word_seven,String word_eight,String word_nine) {

    row_five = random.nextInt(num_rows_and_columns - word_five.length + 1);
    column_five = random.nextInt(num_rows_and_columns - word_five.length + 1);

    int num_of_tentatives=0;
    bool connection_one = false;
    bool connection_two = false;
    bool connection_three = false;
    bool connection_four = false;
    bool connection_five=false;
    bool connection_six=false;
    bool connection_seven=false;
    bool connection_eight=false;
    bool connection_nine=false;
    bool connection_ten=false;
    random.nextInt(2) == 0 ? word_one_reverse = false : word_one_reverse = true;
    random.nextInt(2) == 0 ? word_two_reverse = false : word_two_reverse = true;
    random.nextInt(2) == 0 ? word_three_reverse = false : word_three_reverse =
    true;
    random.nextInt(2) == 0 ? word_four_reverse = false : word_four_reverse =
    true;
    random.nextInt(2) == 0 ? word_five_reverse = false : word_five_reverse =
    true;
    random.nextInt(2) == 0 ? word_six_reverse = false : word_six_reverse = true;
    random.nextInt(2) == 0 ? word_seven_reverse = false : word_seven_reverse =
    true;
    random.nextInt(2) == 0 ? word_eight_reverse = false : word_eight_reverse =
    true;
    random.nextInt(2) == 0 ? word_nine_reverse = false : word_nine_reverse =
    true;


    for (int i = 0; i < words[4].length; i++) {
      for (int j = 0; j < words[0].length; j++) {
        if (words[4][i] == words[0][j]) {
          connection_one = true;
          if (random.nextInt(2) == 0) {
            row_one = row_five + i;
            column_one = column_five + i - j;
            if (column_one < 0 ||
                column_one > num_rows_and_columns - word_one.length) {
              row_one = row_five + i;
              column_one = column_five + i + word_one.length - 1 - j;

              if (column_one < 0 ||
                  column_one > num_rows_and_columns - word_one.length) {
                no_connection_one_count++;
              if (no_connection_one_count < 20) {
                  fit_Words_Puzzle(
                      puzzle,
                      word_one,
                      word_two,
                      word_three,
                      word_four,
                      word_five,
                      word_six,
                      word_seven,
                      word_eight,
                      word_nine
                  );
                }else {
                  connection_one = false;
                }
            }else{
                word_one_reverse = true;
                word_five_reverse = false;
                break;
            }
            } else {
              word_one_reverse = false;
              word_five_reverse = false;
              break;
            }
          } else {
            row_one = row_five + word_five.length - i - 1;
            column_one =
                column_five + word_five.length - i - 1 - j;
            if (column_one < 0 ||
                column_one > num_rows_and_columns - word_one.length) {
              row_one = row_five + word_five.length - i - 1;
              column_one = column_five + word_five.length - i - 1+word_one.length-1 - j;
              if (column_one < 0 ||
                  column_one > num_rows_and_columns - word_one.length) {
              no_connection_one_count++;
              if (no_connection_one_count < 20) {
                fit_Words_Puzzle(
                    puzzle,
                    word_one,
                    word_two,
                    word_three,
                    word_four,
                    word_five,
                    word_six,
                    word_seven,
                    word_eight,
                    word_nine
                );
              }else {
                connection_one = false;
              }
              } else {
                word_one_reverse = true;
                word_five_reverse = true;
                break;
              }
            } else {
              word_one_reverse = false;
              word_five_reverse = true;
              break;
            }
          }
        }
      }
      if(connection_one){
        break;
      }
    }

    for (int i = 0; i < words[4].length; i++) {
      for (int j = 0; j < words[1].length; j++) {
        if (words[4][i] == words[1][j]) {
          connection_two = true;
            if (!word_five_reverse) {
              row_two = row_five + i;
              column_two = column_five + i - j;
              if (column_two < 0 ||
                  column_two > num_rows_and_columns - word_two.length ||
                  row_one == row_two) {
                row_two = row_five + i;
                column_two = column_five + i +word_two.length-1 - j;
                if (column_two < 0 ||
                    column_two > num_rows_and_columns - word_two.length ||
                    row_one == row_two) {
                  no_connection_two_count++;
                  if (no_connection_two_count < 15) {
                    fit_Words_Puzzle(
                        puzzle,
                        word_one,
                        word_two,
                        word_three,
                        word_four,
                        word_five,
                        word_six,
                        word_seven,
                        word_eight,
                        word_nine
                    );
                  } else {
                    connection_two = false;
                  }
                } else {
                  word_two_reverse = true;
                  break;
                }
              } else {
                word_two_reverse = false;
                break;
              }
            } else {
              row_two = row_five + word_five.length - i - 1;
              column_two =
                  column_five + word_five.length - i - 1 - j;
              if (column_two < 0 ||
                  column_two > num_rows_and_columns - word_two.length ||
                  row_one == row_two) {
                  row_two = row_five + word_five.length - i - 1;
                  column_two = column_five + word_five.length - i - 1+word_two.length-1 - j;
                  if (column_two < 0 ||
                      column_two > num_rows_and_columns - word_two.length ||
                      row_one == row_two) {
                    no_connection_two_count++;
                    if (no_connection_two_count < 15) {
                      fit_Words_Puzzle(
                          puzzle,
                          word_one,
                          word_two,
                          word_three,
                          word_four,
                          word_five,
                          word_six,
                          word_seven,
                          word_eight,
                          word_nine
                      );
                    } else {
                      connection_two = false;
                    }
                  } else {
                    word_two_reverse = true;
                    break;
                  }
              } else {
                word_two_reverse = false;
                break;
              }
            }
          }
      }
      if(connection_two){
        break;
      }
    }

    if (!connection_one) {
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

    if (!connection_two) {
      int k = 0;
      while (k < word_five.length * word_two.length) {
        k = 0;
        row_two =
            random.nextInt(num_rows_and_columns);
        column_two = random.nextInt(num_rows_and_columns - word_two.length + 1);
        for (int i = 0; i < word_five.length; i++) {
          for (int j = 0; j < word_two.length; j++) {
            if (!((row_five + i == row_two &&
                column_five + i == column_two + j) || row_one == row_two)) {
              k++;
            }
          }
        }
      }
    }


    for (int i = 0; i < words[1].length; i++) {
      for (int j = 0; j < words[2].length; j++) {
        if (words[1][i] == words[2][j]) {
          connection_three = true;
          if (!word_two_reverse) {
            row_three = row_two - j;
            column_three = column_two + i;
            int k = 0;
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
            if (row_three < 0 ||
                row_three > num_rows_and_columns - word_three.length ||
                k != 0) {
              row_three = row_two-word_three.length+1 + j;
              column_three = column_two + i;
              k=0;
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
              if (row_three < 0 ||
                  row_three > num_rows_and_columns - word_three.length ||
                  k != 0) {
              no_connection_three_count++;
              if (no_connection_three_count < 5) {
                fit_Words_Puzzle(
                    puzzle,
                    word_one,
                    word_two,
                    word_three,
                    word_four,
                    word_five,
                    word_six,
                    word_seven,
                    word_eight,
                    word_nine
                );
              } else {
                connection_three = false;
              }
            }  else {
                word_three_reverse = true;
                word_two_reverse = false;
                break;
              }
            }else {
              word_three_reverse = false;
              word_two_reverse = false;
              break;
            }
          } else {
            row_three = row_two - j;
            column_three = column_two + word_two.length - i - 1;
            int k = 0;
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
            if (row_three < 0 ||
                row_three > num_rows_and_columns - word_three.length ||
                k != 0) {
              row_three = row_two - word_three.length + 1 + j;
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
              if (row_three < 0 ||
                  row_three > num_rows_and_columns - word_three.length ||
                  k != 0) {
              no_connection_three_count++;
              if (no_connection_three_count < 5) {
                fit_Words_Puzzle(
                    puzzle,
                    word_one,
                    word_two,
                    word_three,
                    word_four,
                    word_five,
                    word_six,
                    word_seven,
                    word_eight,
                    word_nine
                );
              } else {
                connection_three = false;
              }
            }else{
                word_three_reverse = true;
                word_two_reverse = true;
                break;
            }
            } else {
              word_three_reverse = false;
              word_two_reverse = true;
              break;
            }
          }
        }
      }
      if(connection_three){
        break;
      }
    }


    if (!connection_three) {
      num_of_tentatives = 0;
      int k = 0;
      while (k < word_five.length * word_three.length) {
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
              word_eight,
              word_nine
          );
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
      }
    }


    for (int i=0;i<words[0].length;i++ ) {
      for (int j = 0; j < words[3].length; j++) {
        if (words[0][i] == words[3][j]) {
          connection_four = true;
          if (!word_one_reverse) {
            row_four = row_one - j;
            column_four = column_one + i;
            int k = 0;
            for(int y=0;y<word_five.length;y++){
              for (int x=0;x<word_four.length;x++){
                if((row_five+y==row_four+x && column_five+y==column_four)||
                column_four==column_three  ||
                    (column_four>=column_two && column_four<=column_two+word_two.length-1
                        && row_four<=row_two && row_four+word_four.length-1>=row_two)){
                  k++;
                }
              }
            }
            if (row_four < 0 ||
                row_four > num_rows_and_columns - word_four.length ||
                k != 0) {
              row_four = row_one-word_four.length+1 + j;
              column_four = column_one + i;
              k=0;
              for(int y=0;y<word_five.length;y++){
                for (int x=0;x<word_four.length;x++){
                  if((row_five+y==row_four+x && column_five+y==column_four)||
                      column_four==column_three  ||
                      (column_four>=column_two && column_four<=column_two+word_two.length-1
                          && row_four<=row_two && row_four+word_four.length-1>=row_two)){
                    k++;
                  }
                }
              }
              if (row_four < 0 ||
                  row_four > num_rows_and_columns - word_four.length ||
                  k != 0) {
                  connection_four = false;
                }
                else {
                word_four_reverse = true;
                word_one_reverse = false;
                break;
              }
            }else {
              word_four_reverse = false;
              word_one_reverse = false;
              break;
            }
          } else {
            row_four = row_one - j;
            column_four = column_one + word_one.length - i - 1;
            int k = 0;

            for(int y=0;y<word_five.length;y++){
              for (int x=0;x<word_four.length;x++){
                if((row_five+y==row_four+x && column_five+y==column_four)||
                    column_four==column_three  ||
                    (column_four>=column_two && column_four<=column_two+word_two.length-1
                        && row_four<=row_two && row_four+word_four.length-1>=row_two)){
                  k++;
                }
              }
            }

            if (row_four < 0 ||
                row_four > num_rows_and_columns - word_four.length ||
                k != 0) {
              row_four = row_one - word_four.length + 1 + j;
              column_four = column_one + word_one.length - i - 1;
              k = 0;


              for(int y=0;y<word_five.length;y++){
                for (int x=0;x<word_four.length;x++){
                  if((row_five+y==row_four+x && column_five+y==column_four)||
                      column_four==column_three  ||
                      (column_four>=column_two && column_four<=column_two+word_two.length-1
                          && row_four<=row_two && row_four+word_four.length-1>=row_two)){
                    k++;
                  }
                }
              }


              if (row_four < 0 ||
                  row_four > num_rows_and_columns - word_four.length ||
                  k != 0) {
                  connection_four = false;
                } else{
                word_four_reverse = true;
                word_one_reverse = true;
                break;
              }
            } else {
              word_four_reverse = false;
              word_one_reverse = true;
              break;
            }
          }

        }
      }
      if(connection_four){
        break;
      }
    }


    if(!connection_four) {
      num_of_tentatives = 0;
      int k = 0;
      while (k < word_five.length * word_four.length) {
        k = 0;
        row_four = random.nextInt(num_rows_and_columns - word_four.length + 1);
        column_four = random.nextInt(num_rows_and_columns);
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
              word_eight,
              word_nine
          );
        }
        for(int y=0;y<word_five.length;y++){
          for (int x=0;x<word_four.length;x++){
            if((row_five+y==row_four+x && column_five+y==column_four)||
                column_four==column_three || (column_four>=column_one && column_four<=column_one+word_one.length-1
                && row_four<=row_one && row_four+word_four.length-1>=row_one) ||
                (column_four>=column_two && column_four<=column_two+word_two.length-1
                    && row_four<=row_two && row_four+word_four.length-1>=row_two)){
              k++;
            }
          }
        }
      }
    }
    for (int i = 0; i < words[3].length; i++) {
      for (int j = 0; j < words[5].length; j++) {
        if (words[3][i] == words[5][j]) {
          connection_five = true;
          if (!word_four_reverse) {
            row_six = row_four + i;
            column_six = column_four - j;
            int k = 0;

            for (int p = 0; p < word_five.length; p++) {
              for (int l = 0; l < word_six.length; l++) {
                if ((row_five + p == row_six &&
                    column_five + p == column_six + l) || row_six == row_one ||
                    row_six == row_two
                    || (column_six <= column_three &&
                        column_six + word_six.length - 1 >= column_three &&
                        row_six >= row_three &&
                        row_six <= row_three + word_three.length - 1)) {
                  k++;
                }
              }
            }

            if (column_six < 0 ||
                column_six > num_rows_and_columns - word_six.length ||
                k != 0) {
              row_six = row_four + i;
              column_six = column_four - word_six.length + 1 + j;
              int k = 0;

              for (int p = 0; p < word_five.length; p++) {
                for (int l = 0; l < word_six.length; l++) {
                  if ((row_five + p == row_six &&
                      column_five + p == column_six + l) || row_six == row_one ||
                      row_six == row_two
                      || (column_six <= column_three &&
                          column_six + word_six.length - 1 >= column_three &&
                          row_six >= row_three &&
                          row_six <= row_three + word_three.length - 1)) {
                    k++;
                  }
                }
              }
              if (column_six < 0 ||
                  column_six > num_rows_and_columns - word_six.length ||
                  k != 0) {
                connection_five = false;
              } else {
                word_six_reverse = true;
                break;
              }
            } else {
              word_six_reverse = false;
              break;
            }

          } else {
            column_six = column_four-j;
            row_six = row_four+word_four.length-1 - i;
            int k = 0;

            for (int p = 0; p < word_five.length; p++) {
              for (int l = 0; l < word_six.length; l++) {
                if ((row_five + p == row_six &&
                    column_five + p == column_six + l) || row_six == row_one ||
                    row_six == row_two
                    || (column_six <= column_three &&
                        column_six + word_six.length - 1 >= column_three &&
                        row_six >= row_three &&
                        row_six <= row_three + word_three.length - 1)) {
                  k++;
                }
              }
            }

            if (column_six < 0 ||
                column_six > num_rows_and_columns - word_six.length ||
                k != 0) {
              column_six = column_four-word_six.length+1 + j;
              row_six = row_four + word_four.length - 1 - i;
              int k = 0;

              for (int p = 0; p < word_five.length; p++) {
                for (int l = 0; l < word_six.length; l++) {
                  if ((row_five + p == row_six &&
                      column_five + p == column_six + l) || row_six == row_one ||
                      row_six == row_two
                      || (column_six <= column_three &&
                          column_six + word_six.length - 1 >= column_three &&
                          row_six >= row_three &&
                          row_six <= row_three + word_three.length - 1)) {
                    k++;
                  }
                }
              }

              if (column_six < 0 ||
                  column_six > num_rows_and_columns - word_six.length ||
                  k != 0) {
                connection_five = false;
              } else {
                word_six_reverse = true;
                break;
              }
            }
              else {
              word_six_reverse = false;
              break;
            }
          }
        }
      }
      if(connection_five){
        break;
      }
    }


if(!connection_five) {
  for (int f = 0; f < num_rows_and_columns; f++) {
    int k = 0;
    for (int l = 0; l < num_rows_and_columns - word_six.length + 1; l++) {
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
                  row_six <= row_three + word_three.length - 1))) {
            k++;
          }
        }
      }
      if (k == word_five.length * word_six.length) {
        break;
      }
    }
    if (k == word_five.length * word_six.length) {
      break;
    }
  }
}

    for (int i = 0; i < words[2].length; i++) {
      for (int j = 0; j < words[6].length; j++) {
        if (words[2][i] == words[6][j]) {
          connection_six = true;
          if (!word_three_reverse) {
            row_seven = row_three + i;
            column_seven = row_three - j;
            int k = 0;

            for (int i = 0; i < word_five.length; i++) {
              for (int j = 0; j < word_seven.length; j++) {
                if ((row_five + i == row_seven &&
                    column_five + i == column_seven + j) ||
                    row_seven == row_six ||
                    row_seven == row_one ||
                    row_seven == row_two ||
                    (column_seven <= column_four &&
                        column_seven + word_seven.length - 1 >= column_four &&
                        row_seven >= row_four &&
                        row_seven <= row_four + word_four.length - 1)
                    ) {
                  k++;
                }
              }
            }

            if (column_seven < 0 ||
                column_seven > num_rows_and_columns - word_seven.length ||
                k != 0) {
              row_seven = row_three + i;
              column_seven = column_three-word_seven.length+1 + j;
              int k = 0;

              for (int i = 0; i < word_five.length; i++) {
                for (int j = 0; j < word_seven.length; j++) {
                  if ((row_five + i == row_seven &&
                      column_five + i == column_seven + j) ||
                      row_seven == row_six ||
                      row_seven == row_one ||
                      row_seven == row_two ||
                      (column_seven <= column_four &&
                          column_seven + word_seven.length - 1 >= column_four &&
                          row_seven >= row_four &&
                          row_seven <= row_four + word_four.length - 1)
                  ) {
                    k++;
                  }
                }
              }

              if (column_seven < 0 ||
                  column_seven > num_rows_and_columns - word_seven.length ||
                  k != 0) {
              connection_six = false;
            }else{
                word_seven_reverse = true;
                break;
              }
            }
              else {
              word_seven_reverse = false;
              break;
            }
          } else {
            column_seven = column_three-j;
            row_seven = row_three+word_three.length-1 - i;
            int k = 0;
            for (int i = 0; i < word_five.length; i++) {
              for (int j = 0; j < word_seven.length; j++) {
                if ((row_five + i == row_seven &&
                    column_five + i == column_seven + j) ||
                    row_seven == row_six ||
                    row_seven == row_one ||
                    row_seven == row_two ||
                    (column_seven <= column_four &&
                        column_seven + word_seven.length - 1 >= column_four &&
                        row_seven >= row_four &&
                        row_seven <= row_four + word_four.length - 1)
                ) {
                  k++;
                }
              }
            }

            if (column_seven < 0 ||
                column_seven > num_rows_and_columns - word_seven.length ||
                k != 0) {
              column_seven = column_three +word_seven.length-1+j;
              row_seven = row_three + word_three.length - 1 - i;
              int k = 0;
              for (int i = 0; i < word_five.length; i++) {
                for (int j = 0; j < word_seven.length; j++) {
                  if ((row_five + i == row_seven &&
                      column_five + i == column_seven + j) ||
                      row_seven == row_six ||
                      row_seven == row_one ||
                      row_seven == row_two ||
                      (column_seven <= column_four &&
                          column_seven + word_seven.length - 1 >= column_four &&
                          row_seven >= row_four &&
                          row_seven <= row_four + word_four.length - 1)
                  ) {
                    k++;
                  }
                }
              }

              if (column_seven < 0 ||
                  column_seven > num_rows_and_columns - word_seven.length ||
                  k != 0) {
                connection_six = false;
              }else{
                word_seven_reverse = true;
                break;
              }
            }else {
              word_seven_reverse = false;
              break;
            }
          }
        }
      }
      if(connection_six){
        break;
      }
    }


    if(!connection_six) {
      for (int i = 0; i < words[3].length; i++) {
        for (int j = 0; j < words[6].length; j++) {
          if (words[3][i] == words[6][j]) {
            connection_seven = true;
            if (!word_four_reverse) {
              row_seven = row_four + i;
              column_seven = column_four - j;
              int k = 0;

              for (int i = 0; i < word_five.length; i++) {
                for (int j = 0; j < word_seven.length; j++) {
                  if ((row_five + i == row_seven &&
                      column_five + i == column_seven + j) ||
                      row_seven == row_six ||
                      row_seven == row_one ||
                      row_seven == row_two ||
                       (column_seven <= column_three &&
                          column_seven + word_seven.length - 1 >=
                              column_three &&
                          row_seven >= row_three &&
                          row_seven <= row_three + word_three.length - 1)) {
                    k++;
                  }
                }
              }

              if (column_seven < 0 ||
                  column_seven > num_rows_and_columns - word_seven.length ||
                  k != 0) {
                row_seven = row_four + i;
                column_seven = column_four - word_seven.length + 1 + j;
                int k = 0;

                for (int i = 0; i < word_five.length; i++) {
                  for (int j = 0; j < word_seven.length; j++) {
                    if ((row_five + i == row_seven &&
                        column_five + i == column_seven + j) ||
                        row_seven == row_six ||
                        row_seven == row_one ||
                        row_seven == row_two ||
                        (column_seven <= column_three &&
                            column_seven + word_seven.length - 1 >=
                                column_three &&
                            row_seven >= row_three &&
                            row_seven <= row_three + word_three.length - 1)) {
                      k++;
                    }
                  }
                }
                if (column_seven < 0 ||
                    column_seven > num_rows_and_columns - word_seven.length ||
                    k != 0) {
                  connection_seven = false;
                } else {
                  word_seven_reverse = true;
                  break;
                }
              } else {
                word_seven_reverse = false;
                break;
              }
            } else {
              column_seven = column_four - j;
              row_seven = row_four + word_four.length - 1 - i;
              int k = 0;
              for (int i = 0; i < word_five.length; i++) {
                for (int j = 0; j < word_seven.length; j++) {
                  if ((row_five + i == row_seven &&
                      column_five + i == column_seven + j) ||
                      row_seven == row_six ||
                      row_seven == row_one ||
                      row_seven == row_two ||
                      (column_seven <= column_three &&
                          column_seven + word_seven.length - 1 >=
                              column_three &&
                          row_seven >= row_three &&
                          row_seven <= row_three + word_three.length - 1)) {
                    k++;
                  }
                }
              }

              if (column_seven < 0 ||
                  column_seven > num_rows_and_columns - word_seven.length ||
                  k != 0) {
                column_seven = column_four - word_seven.length + 1 + j;
                row_seven = row_four + word_four.length - 1 - i;
                int k = 0;
                for (int i = 0; i < word_five.length; i++) {
                  for (int j = 0; j < word_seven.length; j++) {
                    if ((row_five + i == row_seven &&
                        column_five + i == column_seven + j) ||
                        row_seven == row_six ||
                        row_seven == row_one ||
                        row_seven == row_two ||
                        (column_seven <= column_three &&
                            column_seven + word_seven.length - 1 >=
                                column_three &&
                            row_seven >= row_three &&
                            row_seven <= row_three + word_three.length - 1)) {
                      k++;
                    }
                  }
                }

                if (column_seven < 0 ||
                    column_seven > num_rows_and_columns - word_seven.length ||
                    k != 0) {
                  connection_seven = false;
                } else {
                  word_seven_reverse = true;
                  break;
                }
              } else {
                word_seven_reverse = false;
                break;
              }
            }
          }
        }
        if (connection_seven) {
          break;
        }
      }
    }
    if(!connection_six && !connection_seven) {
      for (int f = num_rows_and_columns - 1; f > -1; f--) {
        int k = 0;
        for (int l = 0; l < num_rows_and_columns - word_seven.length + 1; l++) {
          row_seven = f;
          column_seven = l;
          k=0;
          for (int i = 0; i < word_five.length; i++) {
            for (int j = 0; j < word_seven.length; j++) {
              if (!((row_five + i == row_seven &&
                  column_five + i == column_seven + j) ||
                  row_seven == row_six ||
                  row_seven == row_one ||
                  row_seven == row_two ||
                  (column_seven <= column_four &&
                      column_seven + word_seven.length - 1 >= column_four &&
                      row_seven >= row_four &&
                      row_seven <= row_four + word_four.length - 1)
                  || (column_seven <= column_three &&
                      column_seven + word_seven.length - 1 >= column_three &&
                      row_seven >= row_three &&
                      row_seven <= row_three + word_three.length - 1))) {
                k++;
              }
            }
          }
          if (k == word_five.length * word_seven.length) {
            break;
          }
        }
        if (k == word_five.length * word_seven.length) {
          break;
        }
      }

      if (row_seven == 0 &&
          column_seven == num_rows_and_columns - word_seven.length) {
        fit_Words_Puzzle(
            puzzle,
            word_one,
            word_two,
            word_three,
            word_four,
            word_five,
            word_six,
            word_seven,
            word_eight,
            word_nine);
      }
    }
    for (int i = 0; i < words[5].length; i++) {
      for (int j = 0; j < words[7].length; j++) {
        if (words[5][i] == words[7][j]) {
          connection_eight = true;
          if (!word_six_reverse) {
            row_eight = row_six -j;
            column_eight = column_six + i;

            int k=0;

            for (int p = 0; p < word_five.length; p++) {
              for (int l = 0; l < word_eight.length; l++) {
                if ((row_five + p == row_eight + l &&
                    column_five + p == column_eight) ||
                    column_eight == column_three || column_eight == column_four ||
                    (
                        row_eight <= row_one &&
                            row_eight + word_eight.length - 1 >= row_one &&
                            column_eight >= column_one &&
                            column_eight <= column_one + word_one.length - 1
                    ) ||
                    (
                        row_eight <= row_two &&
                            row_eight + word_eight.length - 1 >= row_two &&
                            column_eight >= column_two &&
                            column_eight <= column_two + word_two.length - 1
                    )
                    ||

                    (
                        row_eight <= row_seven &&
                            row_eight + word_eight.length - 1 >= row_seven &&
                            column_eight >= column_seven &&
                            column_eight <= column_seven + word_seven.length - 1
                    )
                ){
                  k++;
                }
              }
            }

            if (row_eight < 0 ||
                row_eight > num_rows_and_columns - word_eight.length || k!=0) {
              row_eight = row_six-word_eight.length+1 + j;
              column_eight = column_six + i;

              int k = 0;

              for (int p = 0; p < word_five.length; p++) {
                for (int l = 0; l < word_eight.length; l++) {
                  if ((row_five + p == row_eight + l &&
                      column_five + p == column_eight) ||
                      column_eight == column_three || column_eight == column_four ||
                      (
                          row_eight <= row_one &&
                              row_eight + word_eight.length - 1 >= row_one &&
                              column_eight >= column_one &&
                              column_eight <= column_one + word_one.length - 1
                      ) ||
                      (
                          row_eight <= row_two &&
                              row_eight + word_eight.length - 1 >= row_two &&
                              column_eight >= column_two &&
                              column_eight <= column_two + word_two.length - 1
                      )
                      ||

                      (
                          row_eight <= row_seven &&
                              row_eight + word_eight.length - 1 >= row_seven &&
                              column_eight >= column_seven &&
                              column_eight <= column_seven + word_seven.length - 1
                      )
                  ){
                    k++;
                  }
                }
              }

              if (row_eight < 0 ||
                  row_eight > num_rows_and_columns - word_eight.length ||
                  k != 0) {
                connection_eight = false;
              }else {
                word_eight_reverse = true;
                break;
              }
            }
            else {
              word_eight_reverse = false;
              break;
            }
          } else {
            row_eight = row_six-j;
            column_eight=column_six+word_seven.length-1-i;
            int k=0;


            for (int p = 0; p < word_five.length; p++) {
              for (int l = 0; l < word_eight.length; l++) {
                if ((row_five + p == row_eight + l &&
                    column_five + p == column_eight) ||
                    column_eight == column_three || column_eight == column_four ||
                    (
                        row_eight <= row_one &&
                            row_eight + word_eight.length - 1 >= row_one &&
                            column_eight >= column_one &&
                            column_eight <= column_one + word_one.length - 1
                    ) ||
                    (
                        row_eight <= row_two &&
                            row_eight + word_eight.length - 1 >= row_two &&
                            column_eight >= column_two &&
                            column_eight <= column_two + word_two.length - 1
                    )
                    ||

                    (
                        row_eight <= row_seven &&
                            row_eight + word_eight.length - 1 >= row_seven &&
                            column_eight >= column_seven &&
                            column_eight <= column_seven + word_seven.length - 1
                    )
                ){
                  k++;
                }
              }
            }

            if (row_eight < 0 ||
                row_eight > num_rows_and_columns - word_eight.length || k!=0) {
              row_eight = row_six-word_eight.length+1+j;
              column_eight=column_six+word_six.length-1-i;
              int k=0;


              for (int p = 0; p < word_five.length; p++) {
                for (int l = 0; l < word_eight.length; l++) {
                  if ((row_five + p == row_eight + l &&
                      column_five + p == column_eight) ||
                      column_eight == column_three || column_eight == column_four ||
                      (
                          row_eight <= row_one &&
                              row_eight + word_eight.length - 1 >= row_one &&
                              column_eight >= column_one &&
                              column_eight <= column_one + word_one.length - 1
                      ) ||
                      (
                          row_eight <= row_two &&
                              row_eight + word_eight.length - 1 >= row_two &&
                              column_eight >= column_two &&
                              column_eight <= column_two + word_two.length - 1
                      )
                      ||

                      (
                          row_eight <= row_seven &&
                              row_eight + word_eight.length - 1 >= row_seven &&
                              column_eight >= column_seven &&
                              column_eight <= column_seven + word_seven.length - 1
                      )
                  ){
                    k++;
                  }
                }
              }

              if (row_eight < 0 ||
                  row_eight > num_rows_and_columns - word_eight.length || k!=0) {
              connection_eight = false;
            }else {
                word_eight_reverse = true;
                break;
              }
            }else {
              word_eight_reverse = false;
              break;
            }
          }
        }
      }
      if(connection_eight){
        break;
      }
    }
    if(!connection_eight) {
      for (int f = 0; f < num_rows_and_columns-word_eight.length+1; f++) {
        int k = 0;
        for (int l = 0; l < num_rows_and_columns; l++) {
          row_eight = f;
          column_eight = l;
          k=0;
          for (int i = 0; i < word_five.length; i++) {
            for (int j = 0; j < word_eight.length; j++) {
              if (!((row_five + i == row_eight + j &&
                  column_five + i == column_eight) ||
                  column_eight == column_three || column_eight == column_four ||
                  (
                      row_eight <= row_one &&
                          row_eight + word_eight.length - 1 >= row_one &&
                          column_eight >= column_one &&
                          column_eight <= column_one + word_one.length - 1
                  ) ||
                  (
                      row_eight <= row_two &&
                          row_eight + word_eight.length - 1 >= row_two &&
                          column_eight >= column_two &&
                          column_eight <= column_two + word_two.length - 1
                  )
                  ||
                  (
                      row_eight <= row_six &&
                          row_eight + word_eight.length - 1 >= row_six &&
                          column_eight >= column_six &&
                          column_eight <= column_six + word_six.length - 1
                  ) ||
                  (
                      row_eight <= row_seven &&
                          row_eight + word_eight.length - 1 >= row_seven &&
                          column_eight >= column_seven &&
                          column_eight <= column_seven + word_seven.length - 1
                  )
              )) {
                k++;
              }
            }
          }

          if (k == word_five.length * word_eight.length) {
            break;
          }
        }
        if (k == word_five.length * word_eight.length) {
          break;
        }
      }
      if (row_eight == num_rows_and_columns - word_eight.length &&
          column_eight == num_rows_and_columns - 1) {
        fit_Words_Puzzle(
            puzzle,
            word_one,
            word_two,
            word_three,
            word_four,
            word_five,
            word_six,
            word_seven,
            word_eight,
            word_nine);
      }
    }
    for (int i = 0; i < words[7].length; i++) {
      for (int j = 0; j < words[8].length; j++) {
        if (words[7][i] == words[8][j]) {
          connection_nine = true;
          if (!word_eight_reverse) {
            row_nine = row_eight +i;
            column_nine = column_eight - j;

            int k=0;

            for (int p = 0; p < word_five.length; p++) {
              for (int l = 0; l < word_nine.length; l++) {
                if ((row_five + p == row_nine &&
                    column_five + p == column_nine + l) ||
                    row_nine == row_seven || row_nine == row_six ||
                    row_nine == row_one ||
                    row_nine == row_two ||
                    (column_nine <= column_four &&
                        column_nine + word_nine.length - 1 >= column_four &&
                        row_nine >= row_four &&
                        row_nine <= row_four + word_four.length - 1)
                    || (column_nine <= column_three &&
                        column_nine + word_nine.length - 1 >= column_three &&
                        row_nine >= row_three &&
                        row_nine <= row_three + word_three.length - 1)
                    ) {
                  k++;
                }
              }
            }

            if (column_nine < 0 ||
                column_nine > num_rows_and_columns - word_nine.length || k!=0) {
              row_nine = row_eight + i;
              column_nine = column_eight-word_nine.length+1 + j;

              int k = 0;


              for (int p = 0; p < word_five.length; p++) {
                for (int l = 0; l < word_nine.length; l++) {
                  if ((row_five + p == row_nine &&
                      column_five + p == column_nine + l) ||
                      row_nine == row_seven || row_nine == row_six ||
                      row_nine == row_one ||
                      row_nine == row_two ||
                      (column_nine <= column_four &&
                          column_nine + word_nine.length - 1 >= column_four &&
                          row_nine >= row_four &&
                          row_nine <= row_four + word_four.length - 1)
                      || (column_nine <= column_three &&
                          column_nine + word_nine.length - 1 >= column_three &&
                          row_nine >= row_three &&
                          row_nine <= row_three + word_three.length - 1)
                  ) {
                    k++;
                  }
                }
              }

              if (column_nine < 0 ||
                  column_nine > num_rows_and_columns - word_nine.length ||
                  k != 0) {
                connection_nine = false;
              }else {
                word_nine_reverse = true;
                break;
              }
            }else {
              word_nine_reverse = false;
              break;
            }
          } else {
            row_nine = row_eight+word_eight.length-1-i;
            column_nine=column_eight-j;

            int k=0;


            for (int p = 0; p < word_five.length; p++) {
              for (int l = 0; l < word_nine.length; l++) {
                if ((row_five + p == row_nine &&
                    column_five + p == column_nine + l) ||
                    row_nine == row_seven || row_nine == row_six ||
                    row_nine == row_one ||
                    row_nine == row_two ||
                    (column_nine <= column_four &&
                        column_nine + word_nine.length - 1 >= column_four &&
                        row_nine >= row_four &&
                        row_nine <= row_four + word_four.length - 1)
                    || (column_nine <= column_three &&
                        column_nine + word_nine.length - 1 >= column_three &&
                        row_nine >= row_three &&
                        row_nine <= row_three + word_three.length - 1)
                ) {
                  k++;
                }
              }
            }

            if (column_nine < 0 ||
                column_nine > num_rows_and_columns - word_nine.length || k!=0) {
              row_nine = row_eight + word_eight.length - 1 - i;
              column_nine = column_eight-word_nine.length+1 + j;

              int k = 0;


              for (int p = 0; p < word_five.length; p++) {
                for (int l = 0; l < word_nine.length; l++) {
                  if ((row_five + p == row_nine &&
                      column_five + p == column_nine + l) ||
                      row_nine == row_seven || row_nine == row_six ||
                      row_nine == row_one ||
                      row_nine == row_two ||
                      (column_nine <= column_four &&
                          column_nine + word_nine.length - 1 >= column_four &&
                          row_nine >= row_four &&
                          row_nine <= row_four + word_four.length - 1)
                      || (column_nine <= column_three &&
                          column_nine + word_nine.length - 1 >= column_three &&
                          row_nine >= row_three &&
                          row_nine <= row_three + word_three.length - 1)
                  ) {
                    k++;
                  }
                }
              }
              if (column_nine < 0 ||
                  column_nine > num_rows_and_columns - word_nine.length ||
                  k != 0) {
                connection_nine = false;
              }else {
                word_nine_reverse = true;
                break;
              }
            }else {
              word_nine_reverse = false;
              break;
            }
          }
        }
      }
      if(connection_nine){
        break;
      }
    }
    if(!connection_nine) {
      for (int i = 0; i < words[3].length; i++) {
        for (int j = 0; j < words[8].length; j++) {
          if (words[3][i] == words[8][j]) {
            connection_ten = true;
            if (!word_four_reverse) {
              row_nine = row_four + i;
              column_nine = column_four - j;

              int k = 0;

              for (int p = 0; p < word_five.length; p++) {
                for (int l = 0; l < word_nine.length; l++) {
                  if ((row_five + p == row_nine &&
                      column_five + p == column_nine + l) ||
                      row_nine == row_seven || row_nine == row_six ||
                      row_nine == row_one ||
                      row_nine == row_two ||
                      (column_nine <= column_three &&
                          column_nine + word_nine.length - 1 >= column_three &&
                          row_nine >= row_three &&
                          row_nine <= row_three + word_three.length - 1)) {
                    k++;
                  }
                }
              }

              if (column_nine < 0 ||
                  column_nine > num_rows_and_columns - word_nine.length ||
                  k != 0) {
                row_nine = row_four + i;
                column_nine = column_four - word_nine.length + 1 + j;

                int k = 0;

                for (int p = 0; p < word_five.length; p++) {
                  for (int l = 0; l < word_nine.length; l++) {
                    if ((row_five + p == row_nine &&
                        column_five + p == column_nine + l) ||
                        row_nine == row_seven || row_nine == row_six ||
                        row_nine == row_one ||
                        row_nine == row_two ||
                        (column_nine <= column_three &&
                            column_nine + word_nine.length - 1 >= column_three &&
                            row_nine >= row_three &&
                            row_nine <= row_three + word_three.length - 1)) {
                      k++;
                    }
                  }
                }

                if (column_nine < 0 ||
                    column_nine > num_rows_and_columns - word_nine.length ||
                    k != 0) {
                  connection_ten = false;
                } else {
                  word_nine_reverse = true;
                  break;
                }
              } else {
                word_nine_reverse = false;
                break;
              }
            } else {
              row_nine = row_four + word_four.length - 1 - i;
              column_nine = column_four - j;

              int k = 0;

              for (int p = 0; p < word_five.length; p++) {
                for (int l = 0; l < word_nine.length; l++) {
                  if ((row_five + p == row_nine &&
                      column_five + p == column_nine + l) ||
                      row_nine == row_seven || row_nine == row_six ||
                      row_nine == row_one ||
                      row_nine == row_two ||
                       (column_nine <= column_three &&
                          column_nine + word_nine.length - 1 >= column_three &&
                          row_nine >= row_three &&
                          row_nine <= row_three + word_three.length - 1)) {
                    k++;
                  }
                }
              }

              if (column_nine < 0 ||
                  column_nine > num_rows_and_columns - word_nine.length ||
                  k != 0) {
                row_nine = row_four + word_four.length - 1 - i;
                column_nine = column_four - word_nine.length + 1 + j;

                int k = 0;

                for (int p = 0; p < word_five.length; p++) {
                  for (int l = 0; l < word_nine.length; l++) {
                    if ((row_five + p == row_nine &&
                        column_five + p == column_nine + l) ||
                        row_nine == row_seven || row_nine == row_six ||
                        row_nine == row_one ||
                        row_nine == row_two ||
                         (column_nine <= column_three &&
                            column_nine + word_nine.length - 1 >= column_three &&
                            row_nine >= row_three &&
                            row_nine <= row_three + word_three.length - 1)) {
                      k++;
                    }
                  }
                }

                if (column_nine < 0 ||
                    column_nine > num_rows_and_columns - word_nine.length ||
                    k != 0) {
                  connection_ten = false;
                } else {
                  word_nine_reverse = true;
                  break;
                }
              } else {
                word_nine_reverse = false;
                break;
              }
            }
          }
        }
        if (connection_ten) {
          break;
        }
      }
    }
  if(!connection_nine && !connection_ten) {
    for (int f = 0; f < num_rows_and_columns; f++) {
      int k = 0;
      for (int l = num_rows_and_columns - word_nine.length; l > -1; l--) {
        row_nine = f;
        column_nine = l;
        k=0;
        for (int i = 0; i < word_five.length; i++) {
          for (int j = 0; j < word_nine.length; j++) {
            if (!((row_five + i == row_nine &&
                column_five + i == column_nine + j) ||
                row_nine == row_seven || row_nine == row_six ||
                row_nine == row_one ||
                row_nine == row_two ||
                (column_nine <= column_four &&
                    column_nine + word_nine.length - 1 >= column_four &&
                    row_nine >= row_four &&
                    row_nine <= row_four + word_four.length - 1)
                || (column_nine <= column_three &&
                    column_nine + word_nine.length - 1 >= column_three &&
                    row_nine >= row_three &&
                    row_nine <= row_three + word_three.length - 1) ||
                (column_nine <= column_eight &&
                    column_nine + word_nine.length - 1 >= column_eight &&
                    row_nine >= row_eight &&
                    row_nine <= row_eight + word_eight.length - 1))) {
              k++;
            }
          }
        }
        if (k == word_five.length * word_nine.length) {
          break;
        }
      }
      if (k == word_five.length * word_nine.length) {
        break;
      }
    }
    if (row_nine == num_rows_and_columns - 1 && column_nine == 0) {
      fit_Words_Puzzle(
          puzzle,
          word_one,
          word_two,
          word_three,
          word_four,
          word_five,
          word_six,
          word_seven,
          word_eight,
          word_nine);
    }
  }


  }
  rotate_puzzle(List<String> puzzle, String word_one, String word_two, String word_three, String word_four, String word_five,String word_six
      ,String word_seven, String word_eight, String word_nine){
    int num_rotates=0;
    solution_positions[0] = row_one;
    solution_positions[1] = column_one;
    solution_positions[2] = row_one;
    solution_positions[3] =column_one+word_one.length - 1;
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
    solution_positions[16] = row_five;
    solution_positions[17] = column_five;
    solution_positions[18] = row_five + word_five.length - 1;
    solution_positions[19] = column_five + word_five.length - 1;
    solution_positions[20] = row_six;
    solution_positions[21] = column_six;
    solution_positions[22] = row_six;
    solution_positions[23] = column_six + word_six.length - 1;
    solution_positions[24] = row_seven;
    solution_positions[25] = column_seven;
    solution_positions[26] = row_seven;
    solution_positions[27] = column_seven + word_seven.length - 1;
    solution_positions[28] = row_eight;
    solution_positions[29] = column_eight;
    solution_positions[30] = row_eight + word_eight.length - 1;
    solution_positions[31] = column_eight;
    solution_positions[32] = row_nine;
    solution_positions[33] = column_nine;
    solution_positions[34] = row_nine;
    solution_positions[35] = column_nine + word_nine.length - 1;
    for(int i =0;i<num_rotates;i++) {
      List<String> old_puzzle=['','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''];

      for(int i=0;i<num_rows_and_columns*num_rows_and_columns;i++){
        old_puzzle[i]=puzzle[i];
      }

      for (int j = 0; j < num_rows_and_columns; j++) {
        for (int l = 0; l < num_rows_and_columns; l++) {
          puzzle[num_rows_and_columns * l + j] =
          old_puzzle[num_rows_and_columns * (num_rows_and_columns-1-j) + l];
        }
      }
      row_one=solution_positions[0];
      column_one=solution_positions[1];

      row_two=solution_positions[4];
      column_two=solution_positions[5];

      row_three=solution_positions[8];
      column_three=solution_positions[9];

      row_four=solution_positions[12];
      column_four=solution_positions[13];

      row_five=solution_positions[16];
      column_five=solution_positions[17];

      row_six=solution_positions[20];
      column_six=solution_positions[21];

      row_seven=solution_positions[24];
      column_seven=solution_positions[25];

      row_eight=solution_positions[28];
      column_eight=solution_positions[29];

      row_nine=solution_positions[32];
      column_nine=solution_positions[33];

      if(num_rotates==1) {
        solution_positions[0] = column_one;
        solution_positions[1] = num_rows_and_columns-1-row_one;
        solution_positions[2] = column_one + word_one.length - 1;
        solution_positions[3] =num_rows_and_columns-1-row_one ;

        solution_positions[4] = column_two;
        solution_positions[5] = num_rows_and_columns-1-row_two;
        solution_positions[6] = column_two + word_two.length - 1;
        solution_positions[7] =num_rows_and_columns-1-row_two;

        solution_positions[8] =column_three;
        solution_positions[9] = num_rows_and_columns-1-row_three;
        solution_positions[10] =  column_three;
        solution_positions[11] = num_rows_and_columns-1-row_three - word_three.length + 1;

        solution_positions[12] =column_four;
        solution_positions[13] = num_rows_and_columns-1-row_four;
        solution_positions[14] =  column_four;
        solution_positions[15] = num_rows_and_columns-1-row_four - word_four.length + 1;

        solution_positions[16] = column_five;
        solution_positions[17] = num_rows_and_columns-1-row_five;
        solution_positions[18] =  column_five + word_five.length - 1;
        solution_positions[19] = num_rows_and_columns-1-row_five - word_five.length + 1;

        solution_positions[20] = column_six;
        solution_positions[21] = num_rows_and_columns-1-row_six;
        solution_positions[22] = column_six + word_six.length - 1;
        solution_positions[23] =num_rows_and_columns-1-row_six;

        solution_positions[24] = column_seven;
        solution_positions[25] = num_rows_and_columns-1-row_seven;
        solution_positions[26] = column_seven + word_seven.length - 1;
        solution_positions[27] =num_rows_and_columns-1-row_seven;

        solution_positions[28] =column_eight;
        solution_positions[29] = num_rows_and_columns-1-row_eight;
        solution_positions[30] =  column_eight;
        solution_positions[31] = num_rows_and_columns-1-row_eight - word_eight.length + 1;

        solution_positions[32] = column_nine;
        solution_positions[33] = num_rows_and_columns-1-row_nine;
        solution_positions[34] = column_nine + word_nine.length - 1;
        solution_positions[35] =num_rows_and_columns-1-row_nine;
      }else if(num_rotates==2){
        solution_positions[0] =column_one;
        solution_positions[1] = num_rows_and_columns-1-row_one;
        solution_positions[2] =  column_one;
        solution_positions[3] = num_rows_and_columns-1-row_one - word_one.length + 1;

        solution_positions[4] =column_two;
        solution_positions[5] = num_rows_and_columns-1-row_two;
        solution_positions[6] =  column_two;
        solution_positions[7] = num_rows_and_columns-1-row_two - word_two.length + 1;

        solution_positions[8] = column_three;
        solution_positions[9] = num_rows_and_columns-1-row_three;
        solution_positions[10] = column_three - word_three.length + 1;
        solution_positions[11] =num_rows_and_columns-1-row_three ;

        solution_positions[12] = column_four;
        solution_positions[13] = num_rows_and_columns-1-row_four;
        solution_positions[14] = column_four - word_four.length + 1;
        solution_positions[15] =num_rows_and_columns-1-row_four ;

        solution_positions[16] = column_five;
        solution_positions[17] = num_rows_and_columns-1-row_five;
        solution_positions[18] =  column_five - word_five.length + 1;
        solution_positions[19] = num_rows_and_columns-1-row_five - word_five.length + 1;

        solution_positions[20] =column_six;
        solution_positions[21] = num_rows_and_columns-1-row_six;
        solution_positions[22] =  column_six;
        solution_positions[23] = num_rows_and_columns-1-row_six - word_six.length + 1;

        solution_positions[24] =column_seven;
        solution_positions[25] = num_rows_and_columns-1-row_seven;
        solution_positions[26] =  column_seven;
        solution_positions[27] = num_rows_and_columns-1-row_seven - word_seven.length + 1;

        solution_positions[28] = column_eight;
        solution_positions[29] = num_rows_and_columns-1-row_eight;
        solution_positions[30] = column_eight - word_eight.length + 1;
        solution_positions[31] =num_rows_and_columns-1-row_eight ;

        solution_positions[32] =column_nine;
        solution_positions[33] = num_rows_and_columns-1-row_nine;
        solution_positions[34] =  column_nine;
        solution_positions[35] = num_rows_and_columns-1-row_nine - word_nine.length + 1;
      }else if(num_rotates==3){
        solution_positions[0] = column_one;
        solution_positions[1] = num_rows_and_columns-1-row_one;
        solution_positions[2] = column_one - word_one.length + 1;
        solution_positions[3] =num_rows_and_columns-1-row_one ;

        solution_positions[4] = column_two;
        solution_positions[5] = num_rows_and_columns-1-row_two;
        solution_positions[6] = column_two - word_two.length + 1;
        solution_positions[7] =num_rows_and_columns-1-row_two;

        solution_positions[8] =column_three;
        solution_positions[9] = num_rows_and_columns-1-row_three;
        solution_positions[10] =  column_three;
        solution_positions[11] = num_rows_and_columns-1-row_three + word_three.length - 1;

        solution_positions[12] =column_four;
        solution_positions[13] = num_rows_and_columns-1-row_four;
        solution_positions[14] =  column_four;
        solution_positions[15] = num_rows_and_columns-1-row_four + word_four.length - 1;

        solution_positions[16] = column_five;
        solution_positions[17] = num_rows_and_columns-1-row_five;
        solution_positions[18] =  column_five - word_five.length + 1;
        solution_positions[19] = num_rows_and_columns-1-row_five + word_five.length - 1;

        solution_positions[20] = column_six;
        solution_positions[21] = num_rows_and_columns-1-row_six;
        solution_positions[22] = column_six - word_six.length + 1;
        solution_positions[23] =num_rows_and_columns-1-row_six;

        solution_positions[24] = column_seven;
        solution_positions[25] = num_rows_and_columns-1-row_seven;
        solution_positions[26] = column_seven - word_seven.length + 1;
        solution_positions[27] =num_rows_and_columns-1-row_seven;

        solution_positions[28] =column_eight;
        solution_positions[29] = num_rows_and_columns-1-row_eight;
        solution_positions[30] =  column_eight;
        solution_positions[31] = num_rows_and_columns-1-row_eight + word_eight.length - 1;

        solution_positions[32] = column_nine;
        solution_positions[33] = num_rows_and_columns-1-row_nine;
        solution_positions[34] = column_nine - word_nine.length + 1;
        solution_positions[35] =num_rows_and_columns-1-row_nine;
      }
    }

    }
  write_Words_Puzzle(List<String> puzzle, String word_one,String word_two,String word_three,String word_four,String word_five,String word_six
      ,String word_seven, String word_eight,String word_nine) {

    if (word_five_reverse == false) {
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
    if (word_one_reverse == false) {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * num_rows_and_columns + i + column_one] = word_one[i];
      }
    } else {
      for (int i = 0; i < word_one.length; i++) {
        puzzle[row_one * num_rows_and_columns + i + column_one] =
        word_one[word_one.length - 1 - i];
      }
    }
    if (word_two_reverse == false) {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * num_rows_and_columns + i + column_two] = word_two[i];
      }
    } else {
      for (int i = 0; i < word_two.length; i++) {
        puzzle[row_two * num_rows_and_columns + i + column_two] =
        word_two[word_two.length - 1 - i];
      }
    }

    if (word_three_reverse == false) {
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
    if (word_four_reverse == false) {
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
    if (word_six_reverse == false) {
      for (int i = 0; i < word_six.length; i++) {
        puzzle[row_six * num_rows_and_columns + i + column_six] = word_six[i];
      }
    } else {
      for (int i = 0; i < word_six.length; i++) {
        puzzle[row_six * num_rows_and_columns + i + column_six] =
        word_six[word_six.length - 1 - i];
      }
    }

    if (word_seven_reverse == false) {
      for (int i = 0; i < word_seven.length; i++) {
        puzzle[row_seven * num_rows_and_columns + i + column_seven] = word_seven[i];
      }
    } else {
      for (int i = 0; i < word_seven.length; i++) {
        puzzle[row_seven * num_rows_and_columns + i + column_seven] =
        word_seven[word_seven.length - 1 - i];
      }
    }

    if (word_eight_reverse == false) {
      for (int i = 0; i < word_eight.length; i++) {
        puzzle[(row_eight + i) * num_rows_and_columns + column_eight] =
        word_eight[i];
      }
    } else {
      for (int i = 0; i < word_eight.length; i++) {
        puzzle[(row_eight + i) * num_rows_and_columns + column_eight] =
        word_eight[word_eight.length - 1 - i];
      }
    }

    if (word_nine_reverse == false) {
      for (int i = 0; i < word_nine.length; i++) {
        puzzle[row_nine * num_rows_and_columns + i + column_nine] = word_nine[i];
      }
    } else {
      for (int i = 0; i < word_nine.length; i++) {
        puzzle[row_nine * num_rows_and_columns + i + column_nine] =
        word_nine[word_nine.length - 1 - i];
      }
    }

  }

set_language() {
    String language=AppLocalizations.of(context).translate("game_language");
    if(widget.game_type.type=='food') {
      if (language == 'en') {
        words[0] = "Date".toUpperCase();
        words[1] = "Mango".toUpperCase();
        words[2] = "coco".toUpperCase();
        words[3] = "apple".toUpperCase();
        words[4] = "bean".toUpperCase();
        words[5] = "meat".toUpperCase();
        words[6] = "pea".toUpperCase();
        words[7] = "lime".toUpperCase();
        words[8] = "egg".toUpperCase();
      } else if (language == 'pt') {
        words[0] = "Jambo".toUpperCase();
        words[1] = "Abiu".toUpperCase();
        words[2] = "Baru".toUpperCase();
        words[3] = "Manga".toUpperCase();
        words[4] = "Lima".toUpperCase();
        words[5] = "Akee".toUpperCase();
        words[6] = "Ata".toUpperCase();
        words[7] = "Uva".toUpperCase();
        words[8] = "Uxi".toUpperCase();
      } else if (language == 'fr') {
        words[0] = "pomme".toUpperCase();
        words[1] = "Coing".toUpperCase();
        words[2] = "chou".toUpperCase();
        words[3] = "noix".toUpperCase();
        words[4] = "lime".toUpperCase();
        words[5] = "coco".toUpperCase();
        words[6] = "Taxo".toUpperCase();
        words[7] = "Kaki".toUpperCase();
        words[8] = "Kiwi".toUpperCase();
      } else if (language == 'es') {
        words[0] = "limon".toUpperCase();
        words[1] = "mango".toUpperCase();
        words[2] = "coco".toUpperCase();
        words[3] = "higo".toUpperCase();
        words[4] = "lima".toUpperCase();
        words[5] = "kiwi".toUpperCase();
        words[6] = "mora".toUpperCase();
        words[7] = "uva".toUpperCase();
        words[8] = "yaca".toUpperCase();
      }
    }else if (widget.game_type.type=='animals'){
      if (language == 'en') {
        words[0] = "Apple".toUpperCase();
        words[1] = "Mango".toUpperCase();
        words[2] = "Date".toUpperCase();
        words[3] = "Lime".toUpperCase();
        words[4] = "Pear".toUpperCase();
        words[5] = "Abiu".toUpperCase();
        words[6] = "Fig".toUpperCase();
        words[7] = "bean".toUpperCase();
        words[8] = "Pea".toUpperCase();
      } else if (language == 'pt') {
        words[0] = "Jambo".toUpperCase();
        words[1] = "Manga".toUpperCase();
        words[2] = "Baru".toUpperCase();
        words[3] = "Akee".toUpperCase();
        words[4] = "Lima".toUpperCase();
        words[5] = "Abiu".toUpperCase();
        words[6] = "Ata".toUpperCase();
        words[7] = "Uva".toUpperCase();
        words[8] = "Uxi".toUpperCase();
      } else if (language == 'fr') {
        words[0] = "pomme".toUpperCase();
        words[1] = "Coing".toUpperCase();
        words[2] = "chou".toUpperCase();
        words[3] = "noix".toUpperCase();
        words[4] = "lime".toUpperCase();
        words[5] = "coco".toUpperCase();
        words[6] = "Taxo".toUpperCase();
        words[7] = "Kaki".toUpperCase();
        words[8] = "Kiwi".toUpperCase();
      } else if (language == 'es') {
        words[0] = "limon".toUpperCase();
        words[1] = "mango".toUpperCase();
        words[2] = "coco".toUpperCase();
        words[3] = "higo".toUpperCase();
        words[4] = "lima".toUpperCase();
        words[5] = "kiwi".toUpperCase();
        words[6] = "mora".toUpperCase();
        words[7] = "uva".toUpperCase();
        words[8] = "yaca".toUpperCase();
      }
    }
    else if (widget.game_type.type=='diverse'){
      if (language == 'en') {
        words[0] = "Apple".toUpperCase();
        words[1] = "Mango".toUpperCase();
        words[2] = "Date".toUpperCase();
        words[3] = "Lime".toUpperCase();
        words[4] = "Pear".toUpperCase();
        words[5] = "Abiu".toUpperCase();
        words[6] = "Fig".toUpperCase();
        words[7] = "bean".toUpperCase();
        words[8] = "Pea".toUpperCase();
      } else if (language == 'pt') {
        words[0] = "Jambo".toUpperCase();
        words[1] = "Manga".toUpperCase();
        words[2] = "Baru".toUpperCase();
        words[3] = "Akee".toUpperCase();
        words[4] = "Lima".toUpperCase();
        words[5] = "Abiu".toUpperCase();
        words[6] = "Ata".toUpperCase();
        words[7] = "Uva".toUpperCase();
        words[8] = "Uxi".toUpperCase();
      } else if (language == 'fr') {
        words[0] = "pomme".toUpperCase();
        words[1] = "Coing".toUpperCase();
        words[2] = "chou".toUpperCase();
        words[3] = "noix".toUpperCase();
        words[4] = "lime".toUpperCase();
        words[5] = "coco".toUpperCase();
        words[6] = "Taxo".toUpperCase();
        words[7] = "Kaki".toUpperCase();
        words[8] = "Kiwi".toUpperCase();
      } else if (language == 'es') {
        words[0] = "limon".toUpperCase();
        words[1] = "mango".toUpperCase();
        words[2] = "coco".toUpperCase();
        words[3] = "higo".toUpperCase();
        words[4] = "lima".toUpperCase();
        words[5] = "kiwi".toUpperCase();
        words[6] = "mora".toUpperCase();
        words[7] = "uva".toUpperCase();
        words[8] = "yaca".toUpperCase();
      }
    }
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

  showAlertDialog(BuildContext context) {

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
}