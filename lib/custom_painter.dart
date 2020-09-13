import 'package:flutter/material.dart';
import 'dart:math';
class DrawingPainter extends CustomPainter {

  DrawingPainter({this.pointsList});
  List<DrawingPoints> pointsList;
  List<Offset> offsetPoints = List();

  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length; i++) {
      if (pointsList[i].first) {
        if (pointsList.length - 1 == i) {
          canvas.drawCircle(pointsList[i].points, size.height / 30, pointsList[i].paint);
        }
      } else {
        if (pointsList[i - 1].points.dx == pointsList[i].points.dx
            && pointsList[i - 1].points.dy > pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 15,
              width: size.height / 15,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx == pointsList[i].points.dx
            && pointsList[i - 1].points.dy < pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 15,
              width: size.height / 15,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx > pointsList[i].points.dx
            && pointsList[i - 1].points.dy == pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx < pointsList[i].points.dx
            && pointsList[i - 1].points.dy == pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx == pointsList[i].points.dx
            && pointsList[i - 1].points.dy > pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 15,
              width: size.height / 15,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx == pointsList[i].points.dx
            && pointsList[i - 1].points.dy < pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 15,
              width: size.height / 15,),
            0,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx > pointsList[i].points.dx
            && pointsList[i - 1].points.dy == pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else if (pointsList[i - 1].points.dx < pointsList[i].points.dx
            && pointsList[i - 1].points.dy == pointsList[i].points.dy) {
          canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
              pointsList[i].paint);
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i - 1].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
          canvas.drawArc(
            Rect.fromCenter(
              center: pointsList[i].points,
              height: size.height / 15,
              width: size.height / 15,),
            3.1415926535897932 * 3 / 2,
            3.1415926535897932,
            true,
            pointsList[i].paint,
          );
        } else {

          if (pointsList[i - 1].points.dx < pointsList[i].points.dx
              && pointsList[i - 1].points.dy < pointsList[i].points.dy) {
            canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
                pointsList[i].paint);
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i - 1].points,
                height: size.height / 15,
                width: size.height / 15,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 15,
                width: size.height / 15,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
          } else if (pointsList[i - 1].points.dx < pointsList[i].points.dx
              && pointsList[i - 1].points.dy > pointsList[i].points.dy) {
            canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
                pointsList[i].paint);
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i - 1].points,
                height: size.height / 15,
                width: size.height / 15,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 15,
                width: size.height / 15,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );

          } else if (pointsList[i - 1].points.dx > pointsList[i].points.dx
              && pointsList[i - 1].points.dy< pointsList[i].points.dy) {
            canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
                pointsList[i].paint);
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i - 1].points,
                height: size.height / 15,
                width: size.height / 15,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 15,
                width: size.height / 15,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );

          } else if (pointsList[i - 1].points.dx > pointsList[i].points.dx
              && pointsList[i - 1].points.dy > pointsList[i].points.dy) {
            canvas.drawLine(pointsList[i - 1].points, pointsList[i].points,
                pointsList[i].paint);
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i - 1].points,
                height: size.height / 15,
                width: size.height / 15,),
              -3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
            canvas.drawArc(
              Rect.fromCenter(
                center: pointsList[i].points,
                height: size.height / 15,
                width: size.height / 15,),
              3.1415926535897932 / 2+atan((pointsList[i].points.dy-pointsList[i-1].points.dy)/(pointsList[i].points.dx-pointsList[i-1].points.dx)),
              3.1415926535897932,
              true,
              pointsList[i].paint,
            );
          }

        }
      }
    }
  }
  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => false;
}


class DrawingPoints {
  Paint paint;
  Offset points;
  bool first;

  DrawingPoints({this.points, this.paint, this.first});
}