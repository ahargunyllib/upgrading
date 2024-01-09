import 'package:flutter/material.dart';

import 'views/register_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Upgrading",
      initialRoute: RegisterPage.routeName,
      routes: {
        RegisterPage.routeName: (context) => const RegisterPage(),
      },
    );
  }
}
