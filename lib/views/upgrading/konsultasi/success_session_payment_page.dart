import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/views/upgrading/konsultasi/chat_page.dart';

import '../../../core/constant.dart';
import '../../../models/mentor_model.dart';

class SuccessSessionPaymentPage extends StatelessWidget {
  static const routeName = "/success-session-payment";
  const SuccessSessionPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Mentor mentor = (ModalRoute.of(context)!.settings.arguments!
        as Map<String, dynamic>)['mentor'] as Mentor;
    final theme = Theme.of(context);
    final int sessionCounts = (ModalRoute.of(context)!.settings.arguments!
        as Map<String, dynamic>)['sessionCounts'] as int;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
                Image.asset("assets/images/success-payment-icon.png"),
                const SizedBox(height: 16),
                Container(
                    decoration: ShapeDecoration(
                      color: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Pembayaran Berhasil",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 16),
                            Container(
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          strokeAlign:
                                              BorderSide.strokeAlignOutside,
                                          color: Color(0xFFAAC0CD),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: FutureBuilder(
                                        future: mentor.beasiswa.beasiswaLogo,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Image.network(
                                              snapshot.data!,
                                              fit: BoxFit.fill,
                                              width: 22,
                                              height: 22,
                                            );
                                          } else {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      ),
                                    )),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(mentor.beasiswa.nama,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)),
                                    Text(mentor.beasiswa.penyelenggara,
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 26),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("$sessionCounts Sesi",
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total",
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400)),
                                    Text("Rp. ${sessionCounts * mentor.biaya}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            const SizedBox(height: 16),
                            Text(
                                "Silakan membuka halaman \"Daftar Konsultasi\" untuk memulai sesi konsultasi Anda",
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                          ]),
                    )),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                          ChatPage.routeName,
                          arguments: mentor);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: theme.primaryColor,
                    ),
                    child: Text(
                      "Konsultasi Sekarang",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
