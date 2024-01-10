import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upgrading/firebase_options.dart';

import 'core/helper.dart';
import 'themes/app_theme.dart';
import 'views/register_page.dart';
import 'views/login_page.dart';
import 'views/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await Helper.getUserLoggedInStatus().then((value) => {
          if (value != null)
            setState(() {
              _isSignedIn = value;
            })
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Upgrading",
      theme: appTheme(),
      initialRoute: _isSignedIn ? MainPage.routeName : RegisterPage.routeName,
      routes: {
        RegisterPage.routeName: (context) => const RegisterPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        MainPage.routeName: (context) => const MainPage()
      },
    );
  }
}
