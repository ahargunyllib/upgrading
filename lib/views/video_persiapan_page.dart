import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'premium_payment_page.dart';

class VideoPersiapanPage extends StatelessWidget {
  static const routeName = "/video-persiapan";
  const VideoPersiapanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoPersiapanMainWidget();
  }
}

class VideoPersiapanMainWidget extends StatelessWidget {
  const VideoPersiapanMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  color: theme.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 24, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/video-preparation-icon.png"),
                        const SizedBox(height: 8),
                        Text("Akses Fitur Premium",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700)),
                        Text("Video Persiapan",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(height: 12),
                        Text("Paket sudah termasuk:",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 28),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.white),
                              const SizedBox(width: 8),
                              Text("Akses konten video penulisan esai",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                            ]),
                        const SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.white),
                              const SizedBox(width: 8),
                              Text("Akses konten video penulisan esai",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                            ]),
                        const SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.white),
                              const SizedBox(width: 8),
                              Text("Akses konten video penulisan esai",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                            ]),
                        const SizedBox(height: 10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.white),
                              const SizedBox(width: 8),
                              Text("Akses konten video penulisan esai",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                            ]),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 38,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, PremiumPaymentPage.routeName);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              "Rp. xxx.xxx.xx-",
                              style: GoogleFonts.poppins(
                                color: theme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
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
        ),
      ),
    );
  }
}
