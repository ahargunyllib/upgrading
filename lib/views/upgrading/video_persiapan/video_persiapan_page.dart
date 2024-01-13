import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constant.dart';
import 'premium_payment_page.dart';

class VideoPersiapanPage extends StatelessWidget {
  static const routeName = "/video-persiapan";
  const VideoPersiapanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoPersiapanMainWidget();
  }
}

class VideoPersiapanMainWidget extends StatelessWidget {
  const VideoPersiapanMainWidget({super.key});

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    color: theme.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 24, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/video-preparation-icon.png"),
                          const SizedBox(height: 8),
                          Text("Akses Fitur Premium",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700)),
                          Text("Video Persiapan",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 12),
                          Text("Paket sudah termasuk:",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: 28),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.white),
                                const SizedBox(width: 8),
                                Text("Akses konten video penulisan esai",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ]),
                          const SizedBox(height: 10),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.white),
                                const SizedBox(width: 8),
                                Text("Akses konten video penulisan esai",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ]),
                          const SizedBox(height: 10),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.white),
                                const SizedBox(width: 8),
                                Text("Akses konten video penulisan esai",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ]),
                          const SizedBox(height: 10),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.white),
                                const SizedBox(width: 8),
                                Text("Akses konten video penulisan esai",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400)),
                              ]),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 38,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PremiumPaymentPage.routeName);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: Colors.white,
                              ),
                              child: Text(
                                "Rp. xxx.xxx.xx-",
                                style: GoogleFonts.poppins(
                                  color: theme.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Text(
                    "Kembali",
                    style: GoogleFonts.poppins(
                      color: theme.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
