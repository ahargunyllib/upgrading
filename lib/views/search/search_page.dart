import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:upgrading/views/search/beasiswa/beasiswa_page.dart';
import 'package:upgrading/views/search/organisasi/organisasi_page.dart';

import '../../core/constant.dart';

class SearchPage extends StatelessWidget {
  static const routeName = "/search";
  const SearchPage({super.key});

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
            currentIndex: 1,
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
                const Text("Ingin mencari apa?"),
                const SizedBox(height: 33),
                ListTile(
                  leading: Image.asset(
                    "assets/images/beasiswa-icon.png",
                    height: 118,
                    // width: 150,
                    fit: BoxFit.contain,
                  ),
                  title: const Text("Beasiswa Pendidikan"),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  horizontalTitleGap: 12,
                  onTap: () {
                    Navigator.of(context).pushNamed(BeasiswaPage.routeName);
                  },
                ),
                const SizedBox(height: 24),
                ListTile(
                  leading: Image.asset(
                    "assets/images/organisasi-icon.png",
                    height: 118,
                    width: 61,
                    fit: BoxFit.contain,
                  ),
                  title: const Text("Organisasi"),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  onTap: () {
                    Navigator.of(context).pushNamed(OrganisasiPage.routeName);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
