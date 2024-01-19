import 'package:expensetrackingapp/ui/add_account.dart';
import 'package:expensetrackingapp/ui/pi_chart.dart';
import 'package:expensetrackingapp/widgets/roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
            centerTitle: true,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
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
                  RoundButton(
                      title: "Add Account",
                      // loading: loading,
                      onTap: () {
                        {
                          setState(
                            () {
                              // loading = false;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddAccount()));
                            },
                          );
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Container(
                    height: 100,
                    width: 350,
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundButton(
                      title: "Add Expense",
                      // loading: loading,
                      onTap: () {
                        {
                          setState(() {
                            // loading = true;
                          });
                        }
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  const MyPieChart()
                ]),
          ),
        ));
  }
}
