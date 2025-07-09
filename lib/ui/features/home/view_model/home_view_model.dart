import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puptask/data/repositories/task_repository.dart';
import 'package:puptask/domain/models/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class TaskDisplay {
  String id;
  String name;
  String description;

  TaskDisplay({
    required this.id,
    required this.name,
    required this.description,
  });

  factory TaskDisplay.fromTask(Task task) {
    return TaskDisplay(
      id: task.key.toString(),
      name: task.name,
      description: task.description,
    );
  }
}

class HomeViewModel extends Bloc<HomeEvent, HomeState> {
  final TaskRepository _taskRepository;

  HomeViewModel({
    required TaskRepository taskRepository,
  }) : _taskRepository = taskRepository,
       super(HomeInitialState()) {
    on<AddTaskEvent>((event, emit) {
      try {
        _taskRepository.addTask(
          name: event.taskName,
          description: event.taskDescription,
        );
      } catch (e) {
        emit(HomeErrorState("Failed to add task: ${e.toString()}"));
        return;
      }
      
      final tasks = _getTasks();
      emit(TasksLoadedState(tasks));
    });

    on<LoadTasksEvent>((event, emit) {
      final tasks = _getTasks();
      emit(TasksLoadedState(tasks));
    });

    on<DeleteTaskEvent>((event, emit) {
      _taskRepository.deleteTask(event.taskId);

      final tasks = _getTasks();
      emit(TasksLoadedState(tasks));
    });
  }

  List<TaskDisplay> _getTasks() {
    final tasks = _taskRepository.tasks;
    return tasks.map((task) => TaskDisplay.fromTask(task)).toList();
  }
}