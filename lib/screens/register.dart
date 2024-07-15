import 'package:flutter/material.dart';
import 'package:home_care/services/auth/authentication.dart';

class Register extends StatefulWidget {
  final Function onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void register() async {
    final auth = AuthServices();

    try {
      await auth.signUpWithEmailPassword(
          email: _emailController.text, password: _passwordController.text);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          TextField(
            controller: _emailController,
          ),
          TextField(
            controller: _passwordController,
          ),
          TextButton(
              onPressed: () {
                register();
              },
              child: Text('Login')),
          TextButton(
              onPressed: () {
                widget.onTap();
              },
              child: Text('Register'))
        ],
      ),
    );
  }
}
