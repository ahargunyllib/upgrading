import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KonsultanItem extends StatelessWidget {
  const KonsultanItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: CircleAvatar(
                    child: Image.asset(
                  "assets/images/dummy-mentor-icon.png",
                  fit: BoxFit.fill,
                )),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Muhammad Benzema",
                      style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  Text("Beasiswa Umum S1 Dalam Negeri (BU.01)",
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w400))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
