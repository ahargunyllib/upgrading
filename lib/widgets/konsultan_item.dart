import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/mentor_model.dart';
import '../views/upgrading/konsultasi/chat_page.dart';

class KonsultanItem extends StatelessWidget {
  final Mentor mentor;
  const KonsultanItem({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ChatPage.routeName, arguments: mentor);
      },
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
                child: FutureBuilder(
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
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mentor.fullName,
                      style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                      softWrap: true,
                    ),
                    Text(
                      mentor.beasiswa.nama,
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
      ),
    );
  }
}
