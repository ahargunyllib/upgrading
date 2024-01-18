import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/views/profile/setting_page.dart';

import '../../core/constant.dart';
import '../../services/user_service.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
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
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("Profile",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, SettingPage.routeName);
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
                height: 160,
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: theme.primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                )),
            FutureBuilder(
              future: UserService().gettingUserData(
                  FirebaseAuth.instance.currentUser!.email.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Image.asset(
                            (snapshot.data!.docs[0].data()
                                as Map<String, dynamic>)['profilePic'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              (snapshot.data!.docs[0].data()
                                  as Map<String, dynamic>)['fullName'],
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      const SizedBox(height: 48),
                      TabBar(
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          indicator: ShapeDecoration(
                              color: theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          controller: _tabController,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          unselectedLabelStyle: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: theme.primaryColor,
                          ),
                          tabs: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: ShapeDecoration(
                                // color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: theme.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('About'),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: ShapeDecoration(
                                // color: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: theme.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Saved'),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: ShapeDecoration(
                                // color: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: theme.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Calender'),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              decoration: ShapeDecoration(
                                // color: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: theme.primaryColor),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Review'),
                            )
                          ]),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          "assets/images/coming-soon-icon.png"),
                                      const SizedBox(height: 12),
                                      Text("COMING",
                                          style: GoogleFonts.poppins(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: theme.primaryColor,
                                              height: 0.8)),
                                      Text("SOON",
                                          style: GoogleFonts.poppins(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: theme.primaryColor,
                                              letterSpacing: 16.8,
                                              height: 0.8)),
                                    ],
                                  )),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          "assets/images/coming-soon-icon.png"),
                                      const SizedBox(height: 12),
                                      Text("COMING",
                                          style: GoogleFonts.poppins(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: theme.primaryColor,
                                              height: 0.8)),
                                      Text("SOON",
                                          style: GoogleFonts.poppins(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: theme.primaryColor,
                                              letterSpacing: 16.8,
                                              height: 0.8)),
                                    ],
                                  )),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          "assets/images/coming-soon-icon.png"),
                                      const SizedBox(height: 12),
                                      Text("COMING",
                                          style: GoogleFonts.poppins(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: theme.primaryColor,
                                              height: 0.8)),
                                      Text("SOON",
                                          style: GoogleFonts.poppins(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: theme.primaryColor,
                                              letterSpacing: 16.8,
                                              height: 0.8)),
                                    ],
                                  )),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          "assets/images/coming-soon-icon.png"),
                                      const SizedBox(height: 12),
                                      Text("COMING",
                                          style: GoogleFonts.poppins(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: theme.primaryColor,
                                              height: 0.8)),
                                      Text("SOON",
                                          style: GoogleFonts.poppins(
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              color: theme.primaryColor,
                                              letterSpacing: 16.8,
                                              height: 0.8)),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                    child: Text("error"),
                  );
                }
              },
            )
          ],
        ));
  }
}
