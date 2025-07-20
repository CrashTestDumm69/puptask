part of 'home_view_model.dart';

abstract class HomeEvent {}

class AddTaskEvent extends HomeEvent {
  final Map<String, dynamic> taskDetails;

  AddTaskEvent(this.taskDetails);
}

class LoadTasksEvent extends HomeEvent {}

class DeleteTaskEvent extends HomeEvent {
  final String taskId;

  DeleteTaskEvent(this.taskId);
}
