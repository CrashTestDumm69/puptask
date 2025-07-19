import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:puptask/data/repositories/settings_repository.dart';
import 'package:puptask/ui/features/auth/widgets/auth_screen.dart';
import 'package:puptask/ui/features/home/widgets/create_task_page.dart';
import 'package:puptask/ui/features/home/widgets/home_screen.dart';
import 'package:puptask/ui/features/onboarding/widgets/onboarding_screen.dart';
import 'package:puptask/ui/features/profile/widgets/profile_screen.dart';
import 'package:puptask/ui/features/settings/widgets/settings_screen.dart';
import 'package:puptask/utils/injection_container.dart';

part 'routes.dart';

final GoRouter router = GoRouter(
  initialLocation: sl<SettingsRepository>().isOnboarded ? Routes.home : Routes.onboarding,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen(viewModel: sl());
      },
    ),
    GoRoute(
      path: Routes.settings,
      builder: (BuildContext context, GoRouterState state) {
        return SettingsScreen(viewModel: sl());
      },
    ),
    GoRoute(
      path: Routes.createTask,
      builder: (context, state) => CreateTaskPage()
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingScreen()
    ),
    GoRoute(
      path: Routes.auth,
      builder: (context, state) => AuthScreen(viewModel: sl())
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => ProfileScreen(viewModel: sl()),
    )
  ],
);