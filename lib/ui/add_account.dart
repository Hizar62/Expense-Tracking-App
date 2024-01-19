import 'package:flutter/material.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData(primarySwatch: Colors.amber)
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text("Add Account"),
            centerTitle: true,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body: Column(
            children: [TextFormField()],
          ),
        ));
  }
}
