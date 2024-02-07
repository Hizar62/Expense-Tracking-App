import 'package:expensetrackingapp/boxes/boxes.dart';
import 'package:expensetrackingapp/models/accounts_model.dart';
import 'package:expensetrackingapp/models/expense_model.dart';
import 'package:expensetrackingapp/ui/add_account.dart';
import 'package:expensetrackingapp/ui/add_expense.dart';
import 'package:expensetrackingapp/ui/pi_chart.dart';
import 'package:expensetrackingapp/ui/remider.dart';

import 'package:expensetrackingapp/widgets/roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/adapters.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

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
      valueListenable: Boxes.getAccountBox().listenable(),
      builder: (context, box, _) {
        return FutureBuilder<double>(
          future: calculateTotalAmount(),
          builder: (context, amountSnapshot) {
            if (amountSnapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (amountSnapshot.hasError) {
              return Text(
                  'Error calculating total amount: ${amountSnapshot.error}');
            } else {
              return ValueListenableBuilder(
                valueListenable: Boxes.getExpenseBox().listenable(),
                builder: (context, box, _) {
                  return FutureBuilder<double>(
                    future: calculateTotalExpenseAmount(),
                    builder: (context, expenseSnapshot) {
                      if (expenseSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (expenseSnapshot.hasError) {
                        return Text(
                            'Error calculating total expense amount: ${expenseSnapshot.error}');
                      } else {
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
                                      ' Balance: ${amountSnapshot.data.toString()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: Checkbox.width,
                                      ),
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
                                      builder: (context) => const AddAccount(),
                                    ),
                                  );
                                },
                              ),
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
                                      ' Expense : ${expenseSnapshot.data.toString()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: Checkbox.width,
                                      ),
                                    ),
                                  ),
                                ),
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
                                      builder: (context) => const AddExpense(),
                                    ),
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
    totalAmount += account!.amount.toDouble();
  }

  return totalAmount;
}

Future<double> calculateTotalExpenseAmount() async {
  var box = await Hive.openBox<ExpenseModel>('expense');

  double totalAmount = 0.0;

  for (var i = 0; i < box.length; i++) {
    var account = box.getAt(i);
    totalAmount += account!.amount.toDouble();
  }

  return totalAmount;
}
