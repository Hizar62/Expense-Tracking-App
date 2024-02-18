import 'package:hive/hive.dart';

part 'reminder_model.g.dart';

@HiveType(typeId: 1)
class ReminderModel extends HiveObject {
  @HiveField(0)
  String taskname;
  @HiveField(1)
  String date;

  ReminderModel({required this.taskname, required this.date});
}
