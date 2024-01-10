import 'package:flutter/material.dart';

import 'themes/app_theme.dart';
import 'views/register_page.dart';
import 'views/login_page.dart';
import 'views/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Upgrading",
      theme: appTheme(),
      initialRoute: RegisterPage.routeName,
      routes: {
        RegisterPage.routeName: (context) => const RegisterPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        MainPage.routeName: (context) => const MainPage()
      },
    );
  }
}
