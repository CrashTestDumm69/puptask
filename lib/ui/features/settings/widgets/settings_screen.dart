import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puptask/ui/core/custom_themes.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );

        } else if (state is SettingsLoadedState) {
          setState(() {
            _theme = state.theme;
          });
          switch (_theme) {
            case "Light":
              AdaptiveTheme.of(context).setTheme(light: CustomThemes.light(), dark: CustomThemes.dark(), notify: false);
              AdaptiveTheme.of(context).setThemeMode(AdaptiveThemeMode.light);
              break;
            case "Dark":
              AdaptiveTheme.of(context).setTheme(light: CustomThemes.light(), dark: CustomThemes.dark(), notify: false);
              AdaptiveTheme.of(context).setThemeMode(AdaptiveThemeMode.dark);
              break;
            case "Midnight":
              AdaptiveTheme.of(context).setTheme(light: CustomThemes.light(), dark: CustomThemes.light(), notify: false);
              AdaptiveTheme.of(context).setThemeMode(AdaptiveThemeMode.dark);
              break;
            default:
              AdaptiveTheme.of(context).setTheme(light: CustomThemes.light(), dark: CustomThemes.dark(), notify: false);
              AdaptiveTheme.of(context).setThemeMode(AdaptiveThemeMode.system);
          }
        }
      },
      child: Scaffold(
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
              trailing: CupertinoSlidingSegmentedControl<String>(
                groupValue: _theme,
                children: Map<String, Widget>.fromEntries(
                  widget.viewModel.themes.map((theme) => MapEntry(theme, Text(theme)))
                ),
                onValueChanged: (theme) {
                  if (theme != null) widget.viewModel.add(ChangeThemeEvent(value: theme));
                }
              )
            ),
          ],
        )
      )
    );
  }
}