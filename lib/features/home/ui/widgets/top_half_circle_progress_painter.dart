import 'dart:math' as math;

import 'package:flutter/material.dart';

class TopHalfProgressPainter extends CustomPainter {
  final double percent;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  TopHalfProgressPainter({
    required this.percent,
    required this.progressColor,
    required this.backgroundColor,
    this.strokeWidth = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    final startAngle = math.pi;
    final sweepAngle = math.pi * percent;

    final backgroundPaint =
        Paint()
          ..color = backgroundColor
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final foregroundPaint =
        Paint()
          ..color = progressColor
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, math.pi, false, backgroundPaint);

    canvas.drawArc(rect, startAngle, sweepAngle, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
