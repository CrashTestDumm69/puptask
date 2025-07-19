import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:puptask/routing/router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() => isLastPage = index == 2);
                  },
                  children: [
                    _buildPage(
                      title: "Welcome to PupTask",
                      description: "Your smart and simple task manager",
                      icon: Icons.check_circle_outline,
                    ),
                    _buildPage(
                      title: "What PupTask Does",
                      description: "Organize, track, and complete your tasks effortlessly.",
                      icon: Icons.task_alt,
                    ),
                    _buildFinalPage(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage({required String title, required String description, required IconData icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 120, color: Colors.blue),
        Text(title),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildFinalPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.cloud_sync, size: 120, color: Colors.blue),
        const Text("Sync with the Cloud?"),
        const Text("Log in to sync your tasks across devices", textAlign: TextAlign.center),
        ElevatedButton(
          onPressed: () {
            context.go(Routes.auth);
          },
          child: const Text("Log In"),
        ),
        TextButton(
          onPressed: () {
            context.go(Routes.home);
          },
          child: const Text("Continue without Login"),
        ),
      ],
    );
  }
}