import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant.dart';
import 'konsultasi/konsultasi_page.dart';
import 'video_persiapan/video_persiapan_page.dart';

class UpgradingPage extends StatelessWidget {
  static const routeName = "/upgrading";
  const UpgradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: 3,
            onTap: (index) {
              Navigator.pushNamed(context, pages[index]);
            },
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: theme.primaryColor),
            selectedItemColor: theme.primaryColor,
            selectedLabelStyle: GoogleFonts.poppins(
                color: theme.primaryColor, fontWeight: FontWeight.w400),
            selectedFontSize: 10,
            unselectedIconTheme: IconThemeData(color: theme.focusColor),
            unselectedItemColor: theme.focusColor,
            unselectedLabelStyle: GoogleFonts.poppins(
                color: theme.primaryColor, fontWeight: FontWeight.w400),
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.create_new_folder_outlined),
                label: 'Upgrading',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Access premium features"),
                const SizedBox(height: 33),
                ListTile(
                  leading:
                      Image.asset("assets/images/video-preparation-icon.png"),
                  title: const Text("Preparation Video"),
                  subtitle: const Text(
                      "Access video content of scholarship preparation or organization that you want"),
                  contentPadding: const EdgeInsets.all(16),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(VideoPersiapanPage.routeName);
                  },
                ),
                const SizedBox(height: 24),
                ListTile(
                  leading: Image.asset("assets/images/consultation-icon.png"),
                  title: const Text("Consultation"),
                  subtitle: const Text(
                      "Consultation with awardee of scholarships or organizational membership that you want"),
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
