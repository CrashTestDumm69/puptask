import 'package:puptask/data/services/task_storage_service.dart';
import 'package:puptask/domain/models/task.dart';

class TaskRepository {
  final TaskStorageService _taskStorageService;

  List<Task> get tasks => _taskStorageService.tasks;

  TaskRepository({
    required TaskStorageService taskStorageService,
  }) : _taskStorageService = taskStorageService;

  Future<void> init() async {
    await _taskStorageService.init();
  }

  Future<void> addTask({required String name, required String description}) async {
    try {
      await _taskStorageService.addTask(
        name: name,
        description: description,
      );
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