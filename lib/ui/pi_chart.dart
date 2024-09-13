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
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          double totalAmount = snapshot.data![0];
          double totalExpenseAmount = snapshot.data![1];

          // Check for division by zero
          if (totalAmount + totalExpenseAmount == 0) {
            // Handle the case when both totalAmount and totalExpenseAmount are zero.
            return const Text('No data available.');
          }

          // Calculate percentages
          int totalPercentage =
              ((totalAmount / (totalAmount + totalExpenseAmount)) * 100)
                  .toInt();
          int expensePercentage =
              ((totalExpenseAmount / (totalAmount + totalExpenseAmount)) * 100)
                  .toInt();

          return Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: PieChart(
                swapAnimationDuration: const Duration(milliseconds: 1050),
                PieChartData(sections: [
                  PieChartSectionData(
                    title: 'Amount $totalPercentage%',
                    value: totalPercentage.toDouble(),
                    color: Colors.blue,
                  ),
                  PieChartSectionData(
                    title: 'Expense $expensePercentage%',
                    value: expensePercentage.toDouble(),
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
