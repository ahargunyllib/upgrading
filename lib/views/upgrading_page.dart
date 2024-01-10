import 'package:flutter/material.dart';

class UpgradingPage extends StatelessWidget {
  const UpgradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Icon(
        Icons.upgrade_outlined,
        size: 150,
      ),
    );
  }
}
