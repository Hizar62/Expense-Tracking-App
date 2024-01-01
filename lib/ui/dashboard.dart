import 'package:expensetrackingapp/ui/pi_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Dashboard"),
            centerTitle: true,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Add Account",
              style: TextStyle(fontSize: 20),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Center(
              child: Container(
                height: 100,
                width: 350,
                color: Colors.black12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Add Expense",
              style: TextStyle(fontSize: 20),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              height: 100,
              width: 350,
              color: Colors.black12,
            ),
            const MyPieChart()
          ]),
        ));
  }
}
