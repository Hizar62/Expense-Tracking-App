import 'package:expensetrackingapp/models/accounts_model.dart';
import 'package:expensetrackingapp/models/expense_model.dart';
import 'package:expensetrackingapp/models/reminder_model.dart';
import 'package:expensetrackingapp/ui/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationCacheDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(AccountModelAdapter());
  await Hive.openBox<AccountModel>('account');

  Hive.registerAdapter(ExpenseModelAdapter());
  await Hive.openBox<ExpenseModel>('expense');

  Hive.registerAdapter(ExpenseModelAdapter());
  await Hive.openBox<ReminderModel>('reminder');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const IntroScreen(),
    );
  }
}
