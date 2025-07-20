import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:puptask/routing/router.dart';
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
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailController.text;
    final password = _passwordController.text;

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~_]).{6,}$');

    if (!passwordRegex.hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Password requirements not met. Password must have at least 1 uppercase letter, 1 number and 1 special character',
          ),
        ),
      );
      return;
    }

    if (_isSignUp) {
      widget.viewModel.add(AuthSignUp(email: email, password: password));
    } else {
      widget.viewModel.add(AuthLogIn(email: email, password: password));
    }
  }

  Widget _signUp() {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: SafeArea(
        child: Column(
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
              onPressed: _isLoading ? null : _submit,
              child:
                  _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text('Sign Up'),
            ),
            TextButton(
              style: ButtonStyle(splashFactory: NoSplash.splashFactory),
              onPressed:
                  _isLoading ? null : () => setState(() => _isSignUp = false),
              child: Text('Already have an account? Log In'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logIn() {
    return Scaffold(
      appBar: AppBar(title: Text('Log In')),
      body: SafeArea(
        child: Column(
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
              onPressed: _isLoading ? null : _submit,
              child:
                  _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text('Log In'),
            ),
            TextButton(
              style: ButtonStyle(splashFactory: NoSplash.splashFactory),
              onPressed:
                  _isLoading ? null : () => setState(() => _isSignUp = true),
              child: Text('New to PupTask? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, AuthState>(
      bloc: widget.viewModel,
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          setState(() {
            _isLoading = false;
          });

          context.go(Routes.home);
        } else if (state is AuthError) {
          setState(() {
            _isLoading = false;
          });

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthLoading) {
          setState(() {
            _isLoading = true;
          });
        }
      },
      child: _isSignUp ? _signUp() : _logIn(),
    );
  }
}
