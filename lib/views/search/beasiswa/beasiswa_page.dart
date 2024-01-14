import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/services/scholarship_service.dart';
import 'package:upgrading/views/coming_soon_page.dart';
import 'package:upgrading/widgets/beasiswa_card.dart';

import '../../../core/constant.dart';
import '../../../models/scholarships_model.dart';

class BeasiswaPage extends StatelessWidget {
  static const routeName = "/beasiswa";
  const BeasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          title: Text("Beasiswa Pendidikan",
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
        body: Column(
          children: [
            Container(
              color: theme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/beasiswa-icon.png",
                            width: 85,
                            height: 76,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Beasiswa Pendidikan",
                                    style: GoogleFonts.poppins(
                                        color: theme.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Text(
                                  "Jelajahi berbagai beasiswa dan temukan yang sesuai untuk Anda",
                                  style: GoogleFonts.poppins(
                                      color: theme.primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Container(height: 12, color: theme.primaryColor),
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
                                // TODO: BUG Search
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF606060),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF0A0A0A)),
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
                  const SizedBox(width: 8),
                  Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings, color: theme.primaryColor),
                      )),
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
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(16),
              child: FutureBuilder<QuerySnapshot<Object?>>(
                future: ScholarshipsService().getScholarships(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Beasiswa> beasiswas = [];
                    snapshot.data!.docs.forEach((element) {
                      Beasiswa beasiswa = Beasiswa.fromMap(
                          element.data() as Map<String, dynamic>, element.id);
                      beasiswas.add(beasiswa);
                    });
                    return ListView.builder(
                      itemCount: beasiswas.length,
                      itemBuilder: (context, index) {
                        return BeasiswaCard(beasiswa: beasiswas[index]);
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ))
          ],
        ));
  }
}
