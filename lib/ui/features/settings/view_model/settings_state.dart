part of 'settings_view_model.dart';

abstract class SettingsState {}

class SettingsInitialState extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  final String theme;

  SettingsLoadedState({required this.theme});
}

class SettingsErrorState extends SettingsState {
  final String message;

  SettingsErrorState({required this.message});
}