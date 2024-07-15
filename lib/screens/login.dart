import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function onTap;
  const Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
          TextButton(onPressed: () {}, child: Text('Login')),
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
