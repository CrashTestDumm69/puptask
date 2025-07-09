import 'package:hive_ce/hive.dart';
import 'package:uuid/uuid.dart';

import 'package:puptask/domain/models/task.dart';

class TaskStorageService {
  late final Box<Task> _taskBox;

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> init() async {
    try {
      _taskBox = await Hive.openBox<Task>('tasks');
      _tasks = _getTasks();
    } catch (e) {
      rethrow;
    }
  }

  Task _findTask(String id) {
    final task = _taskBox.get(id);
    if (task == null) {
      throw Exception('Task with id $id not found');
    }
    return task;
  }

  Future<void> addTask({required String name, required String description}) async {
    final task = Task(
      name: name,
      description: description,
    );

    final id = const Uuid().v4();

    await _taskBox.put(id, task);
    
    _tasks = _getTasks();
  }

  Future<void> updateTask(String id, {String? name, String? description}) async {
    try {
      final task = _findTask(id);
      task.name = name ?? task.name;
      task.description = description ?? task.description;
      await task.save();

      _tasks = _getTasks();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      final task = _findTask(id);
      await task.delete();
      
      _tasks = _getTasks();
    } catch (e) {
      rethrow;
    }
  }

  List<Task> _getTasks() {
    return _taskBox.values.toList();
  }
}