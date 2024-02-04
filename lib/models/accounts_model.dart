import 'package:hive/hive.dart';

part 'accounts_model.g.dart';

@HiveType(typeId: 0)
class AccountModel {
  @HiveField(0)
  String accountType;
  @HiveField(1)
  int amount;

  AccountModel({required this.accountType, required this.amount});
}
