import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/views/community_page.dart';
import 'package:upgrading/views/home_page.dart';
import 'package:upgrading/views/profile_page.dart';
import 'package:upgrading/views/search_page.dart';
import 'package:upgrading/views/upgrading_page.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/main";

  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const List<Widget> pages = <Widget>[
      HomePage(),
      SearchPage(),
      CommunityPage(),
      UpgradingPage(),
      ProfilePage()
    ];

    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
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
        body: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
