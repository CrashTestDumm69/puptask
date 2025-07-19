import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:puptask/ui/features/auth/view_model/auth_view_model.dart';

class AuthScreen extends StatefulWidget {
  final AuthViewModel viewModel;
  const AuthScreen({super.key, required this.viewModel});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSignUp = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailController.text;
    final pw = _passwordController.text;

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~_]).{6,}$');

    if (!passwordRegex.hasMatch(pw)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password requirements not met. Password must have at least 1 uppercase letter, 1 number and 1 special character')),
      );
      return;
    }

    if (_isSignUp) {
      widget.viewModel.add(SignUpEvent(email: email, password: pw));
    } else {
      widget.viewModel.add(LogInEvent(email: email, password: pw));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignUp ? 'Sign Up' : 'Log In'),
      ),
      body: SafeArea(
        child: BlocConsumer<AuthViewModel, AuthState>(
          bloc: widget.viewModel,
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Welcome, ${state.user.email}!')),
              );
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: isLoading ? null : _submit,
                  child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white)
                    : Text(_isSignUp ? 'Sign Up' : 'Log In'),
                ),
                TextButton(
                  onPressed: isLoading 
                      ? null 
                      : () => setState(() => _isSignUp = !_isSignUp),
                  child: Text(_isSignUp
                      ? 'Already have an account? Log In'
                      : 'New to PupTask? Sign Up'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
