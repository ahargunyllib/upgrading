import 'package:flutter/material.dart';
import 'package:upgrading/widgets/konsultan_item.dart';

class RiwayatKonsultasiPage extends StatelessWidget {
  const RiwayatKonsultasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: KonsultanItem(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: KonsultanItem(),
        ),
      ],
    );
  }
}
