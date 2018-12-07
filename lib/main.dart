import 'package:advent7_custom_paint/data/data.dart';
import 'package:advent7_custom_paint/widget/color_speed_dial.dart';
import 'package:advent7_custom_paint/widget/painting_widget.dart';
import 'package:advent7_custom_paint/widget/stroke_speed_dial.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      title: 'CustomPaint',
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Color currentColor;
  double currentStrokeWidth;

  @override
  void initState() {
    super.initState();

    currentColor = speedDials[0].color;
    currentStrokeWidth = strokeWidths[0];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('CustomPaint')),
        body: PaintingWidget(
            color: currentColor, strokeWidth: currentStrokeWidth),
        floatingActionButton: Row(
          children: <Widget>[
            ColorSpeedDial(onSelected: color),
            StrokeSpeedDial(onSelected: strokeWidth),
          ],
        ),
      );

  void color(Color color) => setState(() {
        currentColor = color;
      });

  void strokeWidth(double strokeWidth) => setState(() {
        currentStrokeWidth = strokeWidth;
      });
}
