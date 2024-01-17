import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomItem extends StatelessWidget {
  final Future<String> imageUrl;
  final String title;
  final String subtitle;
  const CustomItem(
      {super.key,
      required this.imageUrl,
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
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignInside,
            color: Color(0xFFAAC0CD),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignInside,
                      color: Color(0xFFAAC0CD),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: FutureBuilder(
                    future: imageUrl,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Image.network(
                          snapshot.data!,
                          fit: BoxFit.contain,
                          width: 35,
                          height: 35,
                        );
                      }
                      return Container();
                    },
                  ),
                )),
            const SizedBox(width: 8),
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                    softWrap: true,
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w400),
                    softWrap: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
