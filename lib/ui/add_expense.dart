import 'package:expensetrackingapp/boxes/boxes.dart';
import 'package:expensetrackingapp/models/expense_model.dart';
import 'package:expensetrackingapp/widgets/roundbutton.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final expenseNameController = TextEditingController();
  final expenseAmountController = TextEditingController();
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
                controller: expenseNameController,
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
                controller: expenseAmountController,
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
              TextButton(
                  onPressed: () {
                    final data = ExpenseModel(
                        expenseName: expenseNameController.toString(),
                        amount: int.parse(expenseAmountController.text));

                    final box = Boxes.getExpenseBox();
                    box.add(data);
                    data.save();

                    expenseNameController.clear();
                    expenseAmountController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
