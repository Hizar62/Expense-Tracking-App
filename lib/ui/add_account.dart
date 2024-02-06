import 'package:expensetrackingapp/boxes/boxes.dart';
import 'package:expensetrackingapp/models/accounts_model.dart';
import 'package:expensetrackingapp/ui/dashboard.dart';
import 'package:expensetrackingapp/widgets/roundbutton.dart';
import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  // final typeController = TextEditingController();
  final amountController = TextEditingController();

  String? valueChoose;
  List listItems = ["Bank Account", "Easy Paisa", "Jazz Cash", "Cerdit Card"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Add Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(110.0),
        child: Column(children: [
          DropdownButton(
            hint: const Text("Select Account Type"),
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue as String?;
              });
            },
            items: listItems.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: amountController,
            decoration: const InputDecoration(
              hintText: 'Enter Ammount', // Add your hint here
              labelText: 'Amount', // You can also add a label if needed
              // You can customize other InputDecoration properties as needed
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                final data = AccountModel(
                    accountType: valueChoose.toString(),
                    amount: int.parse(amountController.text));

                final box = Boxes.getAccountBox();
                box.add(data);
                data.save();

                amountController.clear();
                Navigator.pop(context);
              },
              child: const Text("Save")),
        ]),
      ),
    );
  }
}
