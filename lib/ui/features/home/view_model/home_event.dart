part of 'home_view_model.dart';

abstract class HomeEvent {}

class AddTaskEvent extends HomeEvent {
  final String taskName;
  final String taskDescription;

  AddTaskEvent(this.taskName, this.taskDescription);
}

class LoadTasksEvent extends HomeEvent {}

class DeleteTaskEvent extends HomeEvent {
  final String taskId;

  DeleteTaskEvent(this.taskId);
}