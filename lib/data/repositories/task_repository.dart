import 'package:puptask/data/services/task_storage_service.dart';
import 'package:puptask/domain/models/task/task.dart';

class TaskRepository {
  final TaskStorageService _taskStorageService;

  List<Task> get tasks => _taskStorageService.tasks;

  TaskRepository({
    required TaskStorageService taskStorageService,
  }) : _taskStorageService = taskStorageService;

  Future<void> init() async {
    try {
      await _taskStorageService.init();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _taskStorageService.addTask(task);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTask(String id, {String? name, String? description}) async {
    try {
      await _taskStorageService.updateTask(
        id,
        name: name,
        description: description,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await _taskStorageService.deleteTask(id);
    } catch (e) {
      rethrow;
    }
  }
}