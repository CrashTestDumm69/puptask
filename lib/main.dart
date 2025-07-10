import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:puptask/data/repositories/settings_repository.dart';
import 'package:puptask/domain/models/settings.dart';

import 'package:puptask/routing/router.dart';
import 'package:puptask/utils/hive/hive_registrar.g.dart';
import 'package:puptask/utils/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final path = await getApplicationSupportDirectory();
  Hive
    ..init("${path.path}/boxes")
    ..registerAdapters();
  
  await setUpServices();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    late final AdaptiveThemeMode themeMode;
    final themeType = sl<SettingsRepository>().settings.theme.displayName;
    switch (themeType) {
      case "Light":
        themeMode = AdaptiveThemeMode.light;
        break;
      case "Dark":
        themeMode = AdaptiveThemeMode.dark;
        break;
      default:
        themeMode = AdaptiveThemeMode.system;
    }

    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: themeMode,
      builder: (theme, darkTheme) {
        return MaterialApp.router(
          theme: theme,
          darkTheme: darkTheme,
          routerConfig: router,
        );
      },
    );
  }
}