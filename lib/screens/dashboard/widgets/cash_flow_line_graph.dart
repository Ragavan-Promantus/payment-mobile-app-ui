import 'dart:math' as math;

import 'package:flutter/material.dart';

class CashFlowPoint {
  const CashFlowPoint({required this.value, required this.date});

  final double value;
  final DateTime date;
}

class CashFlowLineGraph extends StatefulWidget {
  const CashFlowLineGraph({super.key, required this.points});

  final List<CashFlowPoint> points;

  @override
  State<CashFlowLineGraph> createState() => _CashFlowLineGraphState();
}

class _CashFlowLineGraphState extends State<CashFlowLineGraph> {
  static const int _yTickCount = 4;
  int? _selectedIndex;

  List<CashFlowPoint> get _points => widget.points;

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  List<double> _buildYAxisTicks() {
    if (_points.isEmpty) return const [];
    final minY = _points.map((e) => e.value).reduce(math.min);
    final maxY = _points.map((e) => e.value).reduce(math.max);
    final range = (maxY - minY).abs() < 1 ? 1.0 : (maxY - minY);
    return List.generate(
      _yTickCount,
      (index) => maxY - ((range / (_yTickCount - 1)) * index),
    );
  }

  String _formatTick(double value) => value.toStringAsFixed(0);

  void _selectNearestPoint(double localX, double width) {
    if (_points.length < 2) return;
    const horizontalPadding = 8.0;
    final chartWidth = width - (horizontalPadding * 2);
    if (chartWidth <= 0) return;

    final clampedX = (localX - horizontalPadding).clamp(0.0, chartWidth);
    final step = chartWidth / (_points.length - 1);
    final index = (clampedX / step).round().clamp(0, _points.length - 1);

    setState(() {
      _selectedIndex = _selectedIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_points.isEmpty) {
      return const Center(
        child: Text(
          'No data',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    final yTicks = _buildYAxisTicks();

    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: yTicks
                      .map(
                        (tick) => Text(
                          _formatTick(tick),
                          style: const TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTapDown: (details) {
                        _selectNearestPoint(
                          details.localPosition.dx,
                          constraints.maxWidth,
                        );
                      },
                      child: CustomPaint(
                        painter: _CashFlowLinePainter(
                          points: _points,
                          selectedIndex: _selectedIndex,
                        ),
                        child: const SizedBox.expand(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 42),
            Expanded(
              child: Row(
                children: List.generate(_points.length, (index) {
                  return Expanded(
                    child: Text(
                      _formatDate(_points[index].date),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CashFlowLinePainter extends CustomPainter {
  _CashFlowLinePainter({required this.points, required this.selectedIndex});

  final List<CashFlowPoint> points;
  final int? selectedIndex;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    const horizontalPadding = 8.0;
    const verticalPadding = 10.0;
    final chartRect = Rect.fromLTWH(
      horizontalPadding,
      verticalPadding,
      size.width - (horizontalPadding * 2),
      size.height - (verticalPadding * 2),
    );

    final minY = points.map((e) => e.value).reduce(math.min);
    final maxY = points.map((e) => e.value).reduce(math.max);
    final yRange = (maxY - minY).abs() < 1 ? 1.0 : (maxY - minY);

    final gridPaint = Paint()
      ..color = const Color(0xFFDCE6F5)
      ..strokeWidth = 1;
    for (int i = 0; i < 4; i++) {
      final y = chartRect.top + (chartRect.height / 3) * i;
      canvas.drawLine(
        Offset(chartRect.left, y),
        Offset(chartRect.right, y),
        gridPaint,
      );
    }

    final pointsOffset = <Offset>[];
    for (int i = 0; i < points.length; i++) {
      final x = chartRect.left + (chartRect.width / (points.length - 1)) * i;
      final normalizedY = (points[i].value - minY) / yRange;
      final y = chartRect.bottom - (normalizedY * chartRect.height);
      pointsOffset.add(Offset(x, y));
    }

    final linePath = Path()..moveTo(pointsOffset.first.dx, pointsOffset.first.dy);
    for (int i = 1; i < pointsOffset.length; i++) {
      final prev = pointsOffset[i - 1];
      final curr = pointsOffset[i];
      final controlPoint = Offset((prev.dx + curr.dx) / 2, prev.dy);
      linePath.quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        curr.dx,
        curr.dy,
      );
    }

    final areaPath = Path.from(linePath)
      ..lineTo(pointsOffset.last.dx, chartRect.bottom)
      ..lineTo(pointsOffset.first.dx, chartRect.bottom)
      ..close();

    final areaPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x4D1F5ADB), Color(0x001F5ADB)],
      ).createShader(chartRect);
    canvas.drawPath(areaPath, areaPaint);

    final linePaint = Paint()
      ..color = const Color(0xFF1F5ADB)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawPath(linePath, linePaint);

    final pointPaint = Paint()..color = const Color(0xFF1F5ADB);
    final pointBorderPaint = Paint()..color = Colors.white;
    for (int i = 0; i < pointsOffset.length; i++) {
      final point = pointsOffset[i];
      canvas.drawCircle(point, 5, pointBorderPaint);
      canvas.drawCircle(point, 3, pointPaint);

      if (selectedIndex == i) {
        final labelPainter = TextPainter(
          text: TextSpan(
            text: points[i].value.toStringAsFixed(0),
            style: const TextStyle(
              color: Color(0xFF334155),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        final labelOffset = Offset(
          point.dx - (labelPainter.width / 2),
          point.dy - 18,
        );
        labelPainter.paint(canvas, labelOffset);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CashFlowLinePainter oldDelegate) {
    return oldDelegate.points != points ||
        oldDelegate.selectedIndex != selectedIndex;
  }
}
