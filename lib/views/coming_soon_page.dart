import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComingSoonPage extends StatelessWidget {
  static const routeName = "/coming-soon";
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/coming-soon-icon.png"),
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
    ));
  }
}
