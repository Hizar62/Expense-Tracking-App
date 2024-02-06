import 'package:hive/hive.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 1)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  String expenseName;
  @HiveField(1)
  int amount;

  ExpenseModel({required this.expenseName, required this.amount});
}
