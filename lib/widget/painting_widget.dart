import 'package:advent7_custom_paint/model/custom_stroke.dart';
import 'package:advent7_custom_paint/utils.dart';
import 'package:advent7_custom_paint/widget/painter_widget.dart';
import 'package:flutter/material.dart';

class PaintingWidget extends StatefulWidget {
  final Color color;
  final double strokeWidth;

  const PaintingWidget({Key key, this.color, this.strokeWidth})
      : super(key: key);

  @override
  PaintingWidgetState createState() => PaintingWidgetState();
}

class PaintingWidgetState extends State<PaintingWidget> {
  List<CustomStroke> strokes = [];

  @override
  Widget build(BuildContext context) {
    final PainterWidget painter = PainterWidget(
      strokes: strokes,
      color: widget.color,
      strokeWidth: widget.strokeWidth,
    );

    return GestureDetector(
      child: CustomPaint(
        foregroundPainter: painter,
        child: Container(
          color: DefaultTextStyle.of(context).style.color,
        ),
      ),
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
    );
  }

  void onPanStart(DragStartDetails details) =>
      addStroke(details.globalPosition);

  void onPanUpdate(DragUpdateDetails details) =>
      addStroke(details.globalPosition);

  void onPanEnd(DragEndDetails details) => setState(() {
        strokes = List.of(strokes)..add(null);
      });

  void addStroke(Offset globalPosition) {
    final Offset offset = Utils.localPosition(context, globalPosition);

    final CustomStroke customStroke = CustomStroke(
      color: widget.color,
      strokeWidth: widget.strokeWidth,
      offset: offset,
    );

    setState(() {
      strokes = List.of(strokes)..add(customStroke);
    });
  }
}
