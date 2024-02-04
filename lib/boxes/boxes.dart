import 'package:expensetrackingapp/models/accounts_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<AccountModel> getData() => Hive.box<AccountModel>('account');
}
