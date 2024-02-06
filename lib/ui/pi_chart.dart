import 'package:expensetrackingapp/ui/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 300,
        child: PieChart(
            swapAnimationDuration: const Duration(milliseconds: 750),
            PieChartData(sections: [
              PieChartSectionData(value: 20, color: Colors.blue, title: ''),
              PieChartSectionData(value: 80, color: Colors.amber, title: '')
            ])),
      ),
    );
  }
}

Future<double> a = calculateTotalAmount();
Future<double> b = calculateTotalExpenseAmount();
