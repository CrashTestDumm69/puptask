import 'package:hive_ce/hive.dart';

class Task extends HiveObject {
  String id;
  String name;
  String description;

  Task({
    required this.id,
    required this.name,
    required this.description,
  });
}