part of 'puptask_view_model.dart';

abstract class PuptaskState {
  ThemeType theme;

  PuptaskState({required this.theme});
}

class PuptaskInitialState extends PuptaskState {
  PuptaskInitialState({required super.theme});
}

class PuptaskThemeChange extends PuptaskState {
  PuptaskThemeChange({required super.theme});
}
