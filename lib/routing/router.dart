import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:puptask/ui/features/home/widgets/home_screen.dart';
import 'package:puptask/ui/features/settings/widgets/settings_screen.dart';

part 'routes.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.settings,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsScreen();
      },
    ),
  ],
);
