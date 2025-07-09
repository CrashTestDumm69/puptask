import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:puptask/domain/models/task.dart';
import 'package:puptask/utils/hive/hive_registrar.g.dart';

class TaskStorageService {
  late final Box<Task> _taskBox;

  Future<void> init() async {
    try {
      final path = await getApplicationSupportDirectory();
    
      Hive
        ..init("${path.path}/boxes")
        ..registerAdapters();

      _taskBox = await Hive.openBox<Task>('tasks');
    } catch (e) {
      rethrow;
    }
  }

  Task _findTask(String id) {
    final tasks = getTasks();
    final task = tasks.firstWhere((task) => task.id == id, orElse: () => throw Exception('Task with id $id not found'));
    return task;
  }

  Future<void> addTask({required String name, required String description}) async {
    final task = Task(
      id: const Uuid().v4(),
      name: name,
      description: description,
    );
    
    await _taskBox.add(task);
  }

  Future<void> updateTask(String id, {String? name, String? description}) async {
    try {
      final task = _findTask(id);
      task.name = name ?? task.name;
      task.description = description ?? task.description;
      await task.save();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      final task = _findTask(id);
      await task.delete();
    } catch (e) {
      rethrow;
    }
  }

  List<Task> getTasks() {
    return _taskBox.values.toList();
  }
}