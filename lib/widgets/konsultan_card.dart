import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KonsultanCard extends StatelessWidget {
  const KonsultanCard({super.key});

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
            CircleAvatar(
                child: Image.asset(
              "assets/images/dummy-mentor-icon.png",
              fit: BoxFit.fill,
            )),
            const SizedBox(height: 4),
            Text("Muhammad Benzema",
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
                      child: Image.asset(
                        "assets/images/dummy-beasiswa-icon.png",
                        fit: BoxFit.fill,
                      ),
                    )),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Beasiswa Umum S1 Dalam Negeri (BU.01)",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w700)),
                    Text("Kementerian Agama X LPDP",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("Rp. xx.xxx",
                style: GoogleFonts.poppins(
                    color: theme.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            SizedBox(
              width: 140,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
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
