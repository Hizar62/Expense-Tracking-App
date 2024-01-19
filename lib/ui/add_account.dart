import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
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
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: DropdownButton(
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
        ),
      ),
    );
  }
}