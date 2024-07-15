import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
