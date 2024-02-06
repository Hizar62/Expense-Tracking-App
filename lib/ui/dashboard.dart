import 'dart:ffi';

import 'package:expensetrackingapp/boxes/boxes.dart';
import 'package:expensetrackingapp/models/accounts_model.dart';
import 'package:expensetrackingapp/ui/add_account.dart';
import 'package:expensetrackingapp/ui/add_expense.dart';
import 'package:expensetrackingapp/ui/pi_chart.dart';
import 'package:expensetrackingapp/ui/remider.dart';

import 'package:expensetrackingapp/widgets/roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/adapters.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  final List<Widget> _children = <Widget>[
    DashBoardContent(),
    Reminder(),
  ];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: GNav(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          color: Colors.white,
          activeColor: Colors.white,
          tabs: const [
            GButton(
              gap: 8,
              icon: Icons.home,
              text: "home",
            ),
            GButton(
              gap: 8,
              icon: Icons.calendar_today_rounded,
              text: "Reminder",
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        appBar: AppBar(
          title: const Text("Dashboard"),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: _children[_selectedIndex],
      ),
    );
  }
}

class DashBoardContent extends StatelessWidget {
  const DashBoardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, box, _) {
        var data = box.values.cast<AccountModel>();

        return FutureBuilder<double>(
          future: calculateTotalAmount(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the future is still running, show a loading indicator or placeholder
              // ignore: prefer_const_constructors
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If there is an error, handle it appropriately
              return Text('Error: ${snapshot.error}');
            } else {
              // Use the result of the future in your widget
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 100,
                        width: 350,
                        color: Colors.black12,
                        child: Center(
                          child: Text(
                            snapshot.data.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: Checkbox.width),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RoundButton(
                      title: "Add Account",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAccount()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddExpense()),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const MyPieChart(),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}

Future<double> calculateTotalAmount() async {
  var box = await Hive.openBox<AccountModel>('account');

  double totalAmount = 0.0;

  for (var i = 0; i < box.length; i++) {
    var account = box.getAt(i);
    totalAmount += account!.amount
        .toDouble(); // Assuming 'amount' is an int or double field
  }

  return totalAmount;
}
