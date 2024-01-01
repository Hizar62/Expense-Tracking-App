import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
        sections: [PieChartSectionData(value: 20, color: Colors.blue)]));
  }
}
