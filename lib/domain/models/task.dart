import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

enum Days {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

@JsonSerializable()
class Task extends HiveObject {
  String name;
  String description;
  bool repeat;
  List<Days>? repeatDays;
  List<DateTime>? repeatTimes;
  List<DateTime>? dueDates;

  Task({
    required this.name,
    required this.description,
    required this.repeat,
    this.repeatDays,
    this.repeatTimes,
    this.dueDates
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}