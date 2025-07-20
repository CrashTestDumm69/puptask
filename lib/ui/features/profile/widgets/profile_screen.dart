import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puptask/ui/features/profile/view_model/profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileViewModel viewModel;

  const ProfileScreen({super.key, required this.viewModel});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isProfileAvailable = false;
  String? _email;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.add(LoadProfileEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileViewModel, ProfileState>(
      bloc: widget.viewModel,
      listener: (context, state) {
        if (state is ProfileUnavailable) {
          setState(() {
            _isProfileAvailable = false;
          });
        } else if (state is ProfileLoaded) {
          setState(() {
            _isProfileAvailable = true;
            _email = state.user.email;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SafeArea(
          child:
              !_isProfileAvailable
                  ? Icon(Icons.call_missed_outgoing)
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Email: $_email'), const Text('Password')],
                  ),
        ),
      ),
    );
  }
}
