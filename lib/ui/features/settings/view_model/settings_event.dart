part of 'settings_view_model.dart';

abstract class SettingsEvent {}

class LoadSettingsEvent extends SettingsEvent {}

class ChangeThemeEvent extends SettingsEvent {
  final String value;

  ChangeThemeEvent({required this.value});
}