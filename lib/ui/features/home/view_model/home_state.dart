part of 'home_view_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class TasksLoadedState extends HomeState {
  final List<TaskDisplay> tasks;

  TasksLoadedState(this.tasks);
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
}
