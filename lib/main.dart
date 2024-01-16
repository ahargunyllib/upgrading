import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:upgrading/firebase_options.dart';
import 'package:upgrading/views/coming_soon_page.dart';
import 'package:upgrading/views/community/community_page.dart';
import 'package:upgrading/views/home/home_page.dart';
import 'package:upgrading/views/search/beasiswa/beasiswa_page.dart';
import 'package:upgrading/views/search/beasiswa/detail_beasiswa_page.dart';
import 'package:upgrading/views/upgrading/konsultasi/chat_page.dart';
import 'package:upgrading/views/upgrading/konsultasi/konsultasi_page.dart';
import 'package:upgrading/views/upgrading/konsultasi/profil_konsultan_page.dart';
import 'package:upgrading/views/upgrading/konsultasi/session_payment_page.dart';
import 'package:upgrading/views/upgrading/konsultasi/success_session_payment_page.dart';
import 'package:upgrading/views/upgrading/video_persiapan/category_video_page.dart';
import 'package:upgrading/views/upgrading/video_persiapan/home_video_persiapan_page.dart';
import 'package:upgrading/views/upgrading/video_persiapan/list_video_page.dart';
import 'package:upgrading/views/upgrading/video_persiapan/premium_payment_page.dart';
import 'package:upgrading/views/profile/profile_page.dart';
import 'package:upgrading/views/search/search_page.dart';
import 'package:upgrading/views/upgrading/upgrading_page.dart';
import 'package:upgrading/views/upgrading/video_persiapan/success_premium_payment_page.dart';
import 'package:upgrading/views/upgrading/video_persiapan/video_persiapan_page.dart';

import 'core/helper.dart';
import 'themes/app_theme.dart';
import 'views/auth/register_page.dart';
import 'views/auth/login_page.dart';
import 'views/search/organisasi/detail_organisasi_page.dart';
import 'views/search/organisasi/organisasi_page.dart';

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
      initialRoute: _isSignedIn ? HomePage.routeName : RegisterPage.routeName,
      routes: {
        RegisterPage.routeName: (context) => const RegisterPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
        SearchPage.routeName: (context) => const SearchPage(),
        CommunityPage.routeName: (context) => const CommunityPage(),
        UpgradingPage.routeName: (context) => const UpgradingPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        ComingSoonPage.routeName: (context) => const ComingSoonPage(),
        VideoPersiapanPage.routeName: (context) => const VideoPersiapanPage(),
        KonsultasiPage.routeName: (context) => const KonsultasiPage(),
        PremiumPaymentPage.routeName: (context) => const PremiumPaymentPage(),
        SuccessPremiumPaymentPage.routeName: (context) => const SuccessPremiumPaymentPage(),
        HomeVideoPersiapanPage.routeName: (context) => const HomeVideoPersiapanPage(),
        CategoryVideoPage.routeName: (context) => const CategoryVideoPage(),
        ListVideoPage.routeName: (context) => const ListVideoPage(),
        ProfilKonsultanPage.routeName: (context) => const ProfilKonsultanPage(),
        SessionPaymentPage.routeName: (context) => const SessionPaymentPage(),
        SuccessSessionPaymentPage.routeName: (context) =>
            const SuccessSessionPaymentPage(),
        ChatPage.routeName: (context) => const ChatPage(),
        BeasiswaPage.routeName: (context) => const BeasiswaPage(),
        DetailBeasiswaPage.routeName: (context) => const DetailBeasiswaPage(),
        OrganisasiPage.routeName: (context) => const OrganisasiPage(),
        DetailOrganisasiPage.routeName: (context) => const DetailOrganisasiPage(),
      },
    );
  }
}
