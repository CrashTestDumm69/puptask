import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

enum Days { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

@JsonSerializable()
class Task extends HiveObject {
  String name;
  String description;
  bool completed;
  List<Days>? repeatDays;
  Duration? reminderTime;
  DateTime? dueDate;

  Task({
    required this.name,
    required this.description,
    required this.completed,
    this.repeatDays,
    this.reminderTime,
    this.dueDate,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
