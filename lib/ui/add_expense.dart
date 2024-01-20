import 'package:expensetrackingapp/widgets/roundbutton.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Add Expense"),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(110.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Expense name', // Add your hint here
                  labelText: 'Expense', // You can also add a label if needed
                  // You can customize other InputDecoration properties as needed
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Ammount', // Add your hint here
                  labelText: 'Amount', // You can also add a label if needed
                  // You can customize other InputDecoration properties as needed
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              RoundButton(
                  title: "Save",
                  onTap: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
