import 'package:expensetrackingapp/ui/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<double>>(
      future:
          Future.wait([calculateTotalAmount(), calculateTotalExpenseAmount()]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          double totalAmount = snapshot.data![0];
          double totalExpenseAmount = snapshot.data![1];

          return Center(
            child: Container(
              height: 300,
              width: 300,
              child: PieChart(
                swapAnimationDuration: const Duration(milliseconds: 1050),
                PieChartData(sections: [
                  PieChartSectionData(
                    value: totalAmount,
                    color: Colors.blue,
                  ),
                  PieChartSectionData(
                    value: totalExpenseAmount,
                    color: Colors.amber,
                  )
                ]),
              ),
            ),
          );
        }
      },
    );
  }
}
