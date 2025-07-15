part of 'puptask_view_model.dart';

abstract class PuptaskEvent {}

class ThemeChanged extends PuptaskEvent {
  ThemeType theme;

  ThemeChanged({
    required this.theme
  });
}