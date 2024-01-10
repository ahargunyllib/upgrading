import 'package:flutter/material.dart';

class UpgradingPage extends StatelessWidget {
  const UpgradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Akses fitur premium"),
            const SizedBox(height: 33),
            ListTile(
              leading:
                  Image.asset('../assets/images/video-preparation-icon.png'),
              title: const Text("Video Preparation"),
              subtitle: const Text(
                  "Akses konten video berisi persiapan beasiswa atau organisasi yang Anda inginkan"),
              onTap: () {},
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: Image.asset('../assets/images/consultation-icon.png'),
              title: const Text("Consultation"),
              subtitle: const Text(
                  "Konsultasi dengan penerima beasiswa atau anggota organisasi yang Anda inginkan"),
              onTap: () {},
            )
          ],
        ),
      ),
    ));
  }
}
