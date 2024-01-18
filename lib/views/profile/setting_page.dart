import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constant.dart';
import '../../services/auth_service.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/setting';
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AuthService authService = AuthService();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text("Setting",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: 4,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: theme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(children: [
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search, color: theme.primaryColor),
                              const SizedBox(width: 4),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF606060),
                                      height: 0.12,
                                    ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF0A0A0A),
                                      height: 0.12,
                                    ),
                                  ),
                                  obscureText: false,
                                  enableSuggestions: true,
                                  autocorrect: true,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ]),
              ),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color(0xFFAAC0CD),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(children: [
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
                    leading:
                        const Icon(Icons.account_circle_outlined, size: 24),
                    title: Text(
                      'Account and Security',
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
                    leading: const Icon(Icons.notifications_outlined, size: 24),
                    title: Text(
                      'Notifications',
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
                    leading: const Icon(Icons.language_outlined, size: 24),
                    title: Text(
                      'Languages',
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
                    leading: const Icon(Icons.help_outline_outlined, size: 24),
                    title: Text(
                      'FAQ',
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
                    leading: const Icon(Icons.support_agent_outlined, size: 24),
                    title: Text(
                      'Help and Support',
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(vertical: -4),
                    leading: const Icon(Icons.policy_outlined, size: 24),
                    title: Text(
                      'Terms and Policies',
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                backgroundColor: Colors.white,
                                icon: Image.asset(
                                    "assets/images/logout-icon.png"),
                                title: Text(
                                  'Are you sure you want to log out?',
                                  style: GoogleFonts.poppins(
                                    color: theme.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                actions: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 46,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        authService.signOut();
                                        Navigator.pushReplacementNamed(
                                            context, "/login");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        backgroundColor:
                                            const Color(0xFF741A1A),
                                      ),
                                      child: Text(
                                        'Log out',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 46,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFFAAC0CD)),
                                        backgroundColor: Colors.white,
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: GoogleFonts.poppins(
                                          color: theme.primaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: const Color(0xFF741A1A),
                      ),
                      child: Text(
                        "Log Out",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
