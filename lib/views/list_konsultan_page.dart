import 'package:flutter/material.dart';
import 'package:upgrading/widgets/konsultan_card.dart';

class ListKonsultanPage extends StatelessWidget {
  const ListKonsultanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: KonsultanCard(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: KonsultanCard(),
        ),
      ],
    );
  }
}
