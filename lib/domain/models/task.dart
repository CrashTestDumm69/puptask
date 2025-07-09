import 'package:hive_ce/hive.dart';

class Task extends HiveObject {
  String name;
  String description;

  Task({
    required this.name,
    required this.description,
  });
}