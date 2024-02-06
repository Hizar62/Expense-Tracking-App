import 'package:expensetrackingapp/models/accounts_model.dart';
import 'package:expensetrackingapp/models/expense_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<AccountModel> getAccountBox() => Hive.box<AccountModel>('account');
  static Box<ExpenseModel> getExpenseBox() => Hive.box<ExpenseModel>('expense');
}
