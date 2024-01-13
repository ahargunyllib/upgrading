import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/views/upgrading/konsultasi/profil_konsultan_page.dart';

import '../models/mentor_model.dart';

class KonsultanCard extends StatelessWidget {
  final Mentor mentor;
  const KonsultanCard({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: mentor.profileUrl,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CircleAvatar(
                      child: Image.network(
                    snapshot.data!,
                    fit: BoxFit.fill,
                    width: 50,
                    height: 50,
                  ));
                }
                return Container();
              },
            ),
            const SizedBox(height: 4),
            Text(mentor.fullName,
                style: GoogleFonts.poppins(
                    color: theme.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            Container(
              width: 50,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFAAC0CD),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
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
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Image.network(
                              snapshot.data!,
                              fit: BoxFit.fill,
                              width: 22,
                              height: 22,
                            );
                          }
                          return Container();
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
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w700)),
                    Text(mentor.beasiswa.penyelenggara,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("Rp. ${mentor.biaya}",
                style: GoogleFonts.poppins(
                    color: theme.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            SizedBox(
              width: 160,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfilKonsultanPage.routeName,
                      arguments: mentor);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: theme.primaryColor,
                ),
                child: Text(
                  "Selengkapnya ",
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
    );
  }
}
