import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const CustomCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imagePath, height: 76, fit: BoxFit.cover),
              const SizedBox(width: 12),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: GoogleFonts.poppins(
                            color: theme.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    Text(
                      subtitle,
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
    );
  }
}
