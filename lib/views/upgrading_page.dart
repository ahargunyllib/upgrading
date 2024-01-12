import 'package:flutter/material.dart';
import 'package:upgrading/views/coming_soon_page.dart';
import 'package:upgrading/views/success_session_payment_page.dart';

import 'chat_page.dart';
import 'konsultasi_page.dart';
import 'premium_payment_page.dart';
import 'video_persiapan_page.dart';
import 'profil_konsultan_page.dart';
import 'session_payment_page.dart';

class UpgradingPage extends StatelessWidget {
  static const routeName = "/upgrading";
  const UpgradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => const UpgradingMainWidget();
            break;
          case VideoPersiapanPage.routeName:
            builder = (BuildContext context) => const VideoPersiapanPage();
            break;
          case KonsultasiPage.routeName:
            builder = (BuildContext context) => const KonsultasiPage();
            break;
          case PremiumPaymentPage.routeName:
            builder = (BuildContext context) => const PremiumPaymentPage();
            break;
          case ProfilKonsultanPage.routeName:
            builder = (BuildContext context) => const ProfilKonsultanPage();
            break;
          case SessionPaymentPage.routeName:
            builder = (BuildContext context) => const SessionPaymentPage();
            break;
          case SuccessSessionPaymentPage.routeName:
            builder =
                (BuildContext context) => const SuccessSessionPaymentPage();
            break;
          case ComingSoonPage.routeName:
            builder = (BuildContext context) => const ComingSoonPage();
            break;
          case ChatPage.routeName:
            builder = (BuildContext context) => const ChatPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class UpgradingMainWidget extends StatelessWidget {
  const UpgradingMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Akses Fitur Premium"),
            const SizedBox(height: 33),
            ListTile(
              leading: Image.asset("assets/images/video-preparation-icon.png"),
              title: const Text("Video Persiapan"),
              subtitle: const Text(
                  "Akses konten video berisi persiapan beasiswa atau organisasi yang Anda inginkan"),
              contentPadding: const EdgeInsets.all(16),
              onTap: () {
                Navigator.of(context).pushNamed(VideoPersiapanPage.routeName);
              },
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: Image.asset("assets/images/consultation-icon.png"),
              title: const Text("Konsultasi"),
              subtitle: const Text(
                  "Konsultasi dengan penerima beasiswa atau anggota organisasi yang Anda inginkan"),
              contentPadding: const EdgeInsets.all(16),
              onTap: () {
                Navigator.of(context).pushNamed(KonsultasiPage.routeName);
              },
            )
          ],
        ),
      ),
    ));
  }
}
