import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/organization_model.dart';

class OrganisasiCard extends StatelessWidget {
  final Organisasi organisasi;
  const OrganisasiCard({super.key, required this.organisasi});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            future: organisasi.logoUrl,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Image.network(
                                  snapshot.data!,
                                  fit: BoxFit.contain,
                                  width: 76,
                                  height: 36,
                                );
                              }
                              return Container();
                            },
                          ),
                        )),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              organisasi.nama,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w700),
                              softWrap: true,
                            ),
                            Text(organisasi.penyelenggara,
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.w400))
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Text("Open Registration",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: theme.primaryColor)),
                      const SizedBox(height: 12),
                      Text(organisasi.openRegist,
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: theme.primaryColor)),
                      const SizedBox(height: 16),
                    ],
                  ),
                  Container(
                    height: 70,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Text("Open Registration",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: theme.primaryColor)),
                      const SizedBox(height: 12),
                      Text(organisasi.closeRegist,
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: theme.primaryColor)),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
