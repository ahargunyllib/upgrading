import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/videos_model.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 186,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder(
                  future: video.thumbnail,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        height: 120,
                        color: Colors.transparent,
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            child: Image.network(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            )),
                      );
                    }
                    return Container();
                  }),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      video.judul,
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  video.channel,
                  style: GoogleFonts.poppins(
                    color: theme.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
