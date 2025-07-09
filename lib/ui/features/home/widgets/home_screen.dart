import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:puptask/routing/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push(Routes.settings);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}