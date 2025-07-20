import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:puptask/routing/router.dart';
import 'package:puptask/ui/features/settings/view_model/settings_view_model.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsViewModel viewModel;

  const SettingsScreen({super.key, required this.viewModel});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _theme = 'System';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.add(LoadSettingsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsViewModel, SettingsState>(
      bloc: widget.viewModel,
      listener: (context, state) {
        if (state is SettingsErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SettingsLoadedState) {
          setState(() {
            _theme = state.theme;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings Screen')),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: const Text("Profile"),
                onTap: () => context.push(Routes.profile),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                title: const Text("Theme"),
                trailing: CupertinoSlidingSegmentedControl<String>(
                  proportionalWidth: true,
                  groupValue: _theme,
                  children: Map<String, Widget>.fromEntries(
                    widget.viewModel.themes.map(
                      (theme) => MapEntry(theme, Text(theme)),
                    ),
                  ),
                  onValueChanged: (theme) {
                    if (theme != null) widget.viewModel.add(ChangeThemeEvent(value: theme));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
