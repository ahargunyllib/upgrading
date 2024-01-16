import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqCard extends StatelessWidget {
  final String question;
  final String answer;
  const FaqCard({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ExpansionTile(
      backgroundColor: Colors.white,
      childrenPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFAAC0CD)),
        borderRadius: BorderRadius.circular(8),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFAAC0CD)),
        borderRadius: BorderRadius.circular(8),
      ),
      tilePadding: const EdgeInsets.only(left: 16, right: 16),
      collapsedBackgroundColor: Colors.white,
      title: Text(
        question,
        style: GoogleFonts.poppins(
          color: theme.primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
      children: [
        Text(
          answer,
          style: GoogleFonts.poppins(
            color: theme.primaryColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
