import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<SettingsViewModel, SettingsState>(
      bloc: widget.viewModel,
      listener: (context, state) {
        if (state is SettingsErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );

        } else if (state is SettingsLoadedState) {
          setState(() {
            _theme = state.theme;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings Screen'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                title: const Text("Theme"),
                subtitle: Text("Set the theme of the application"),
                trailing: DropdownButton<String>(
                  value: _theme,
                  items: widget.viewModel.themes.map((theme) {
                    return DropdownMenuItem<String>(
                      value: theme,
                      child: Text(theme),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      widget.viewModel.add(ChangeThemeEvent(value: newValue));
                    }
                  },
                ),
              ),
            ],
          )
        );
      }
    );
  }
}