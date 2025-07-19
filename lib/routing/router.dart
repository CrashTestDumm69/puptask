import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:puptask/data/repositories/settings_repository.dart';
import 'package:puptask/ui/features/auth/widgets/auth_screen.dart';
import 'package:puptask/ui/features/home/widgets/create_task_page.dart';

import 'package:puptask/ui/features/home/widgets/home_screen.dart';
import 'package:puptask/ui/features/onboarding/widgets/onboarding_screen.dart';
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
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final circleTween = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).chain(CurveTween(curve: const Interval(0.0, 0.8, curve: Curves.easeInOut)));

            final fadeTween = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).chain(CurveTween(curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)));

            return Stack(
              children: [
                AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    final screenSize = MediaQuery.sizeOf(context);
                    final maxRadius = (screenSize.width + screenSize.height) * 0.8;
                    final currentRadius = animation.drive(circleTween).value * maxRadius;
                    
                    return ClipPath(
                      clipper: CircleClipper(
                        radius: currentRadius,
                        center: Offset(screenSize.width, screenSize.height),
                      ),
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height,
                        color: Theme.of(context).colorScheme.primaryContainer
                      ),
                    );
                  },
                ),
                FadeTransition(
                  opacity: animation.drive(fadeTween),
                  child: child,
                ),
              ],
            );
          },
          transitionDuration: Duration(milliseconds: 700),
          fullscreenDialog: true,
          child: CreateTaskPage(),
        );
      },
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingScreen()
    ),
    GoRoute(
      path: Routes.auth,
      builder: (context, state) => AuthScreen(viewModel: sl())
    )
  ],
);

class CircleClipper extends CustomClipper<Path> {
  final double radius;
  final Offset center;

  CircleClipper({required this.radius, required this.center});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCircle(center: center, radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}