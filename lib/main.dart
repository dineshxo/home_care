import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_care/firebase_options.dart';
import 'package:home_care/services/auth/auth_check.dart';

import 'package:home_care/services/auth/login_or_register.dart';
import 'package:home_care/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthCheck(),
    );
  }
}
