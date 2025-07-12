import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:puptask/routing/router.dart';
import 'package:puptask/ui/features/home/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskDisplay> _tasks = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.add(LoadTasksEvent());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      bloc: widget.viewModel,
      listener: (context, state) {
        if (state is HomeErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
        else if (state is TasksLoadedState) {
          setState(() {
            _tasks = state.tasks;
          });
        }
      },
      child: Scaffold(
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
        body: Stack(
          children: [
            _tasks.isEmpty
            ? const Center(child: Text("No tasks"))
            : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text(task.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      widget.viewModel.add(DeleteTaskEvent(task.id));
                    },
                  ),
                );
              },
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () => widget.viewModel.add(AddTaskEvent("New task", "Task description")),
                child: const Icon(Icons.add),
              )
            )
          ],
        )
      )
    );
  }
}