import 'package:advent7_custom_paint/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// https://github.com/JohannesMilke/floating_action_button_example
class StrokeSpeedDial extends StatefulWidget {
  final void Function(double) onSelected;

  const StrokeSpeedDial({
    @required this.onSelected,
    Key key,
  }) : super(key: key);

  @override
  StrokeSpeedDialState createState() => StrokeSpeedDialState();
}

class StrokeSpeedDialState extends State<StrokeSpeedDial> {
  double currentStrokeWidth;

  @override
  void initState() {
    super.initState();

    currentStrokeWidth = strokeWidths[0];
  }

  @override
  Widget build(BuildContext context) => Container(
        width: 150.0,
        child: SpeedDial(
            overlayOpacity: 0.0,
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
            child: buildText(currentStrokeWidth),
            visible: true,
            curve: Curves.elasticInOut,
            children: strokeWidths.map(speedDialChild).toList()),
      );

  SpeedDialChild speedDialChild(double strokeWidth) => SpeedDialChild(
        child: CircleAvatar(child: buildText(strokeWidth)),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        onTap: () => onTap(strokeWidth),
        labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      );

  Widget buildText(double strokeWidth) => FittedBox(
        child: Text('${strokeWidth.toInt()}'),
        fit: BoxFit.contain,
      );

  void onTap(double strokeWidth) {
    setState(() {
      currentStrokeWidth = strokeWidth;
    });
    widget.onSelected(strokeWidth);
  }
}
