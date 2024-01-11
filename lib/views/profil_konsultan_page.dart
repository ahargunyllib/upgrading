import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/views/session_payment_page.dart';

class ProfilKonsultanPage extends StatelessWidget {
  static const routeName = "/profil-konsultan";
  const ProfilKonsultanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text("Profil Konsultan",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      child: Image.asset(
                    "assets/images/dummy-mentor-icon.png",
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                  )),
                  const SizedBox(height: 8),
                  Text("Muhammad Benzema",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: ShapeDecoration(
                            color: Colors.transparent,
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          Text("Kementerian Agama X LPDP",
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
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
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Tentang Konsultan",
                              style: GoogleFonts.poppins(
                                  color: theme.primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 12),
                          Container(
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 28),
                          Text(
                              "Lorem ipsum dolor sit amet consectetur. Enim sed sit cursus sed turpis morbi enim. Magna turpis eu volutpat nisi. At leo dolor molestie pulvinar dictum lectus lacinia blandit lobortis. Nunc mauris senectus sed nibh est. Erat lorem semper varius pulvinar non congue. Odio semper.",
                              softWrap: true,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pendidikan",
                              style: GoogleFonts.poppins(
                                  color: theme.primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 12),
                          Container(
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Color(0xFFAAC0CD),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Universitas Brawijaya",
                                          style: GoogleFonts.poppins(
                                              color: theme.primaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 4),
                                      Text("Teknik Komputer",
                                          style: GoogleFonts.poppins(
                                              color: theme.primaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  )
                                ],
                              ),
                              Text("2020-Sekarang",
                                  style: GoogleFonts.poppins(
                                      color: theme.primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pengalaman",
                              style: GoogleFonts.poppins(
                                  color: theme.primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 12),
                          Container(
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Color(0xFFAAC0CD),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Presiden EM UB",
                                          style: GoogleFonts.poppins(
                                              color: theme.primaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 4),
                                      Text("Universitas Brawijaya",
                                          style: GoogleFonts.poppins(
                                              color: theme.primaryColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  )
                                ],
                              ),
                              Text("2020-2023",
                                  style: GoogleFonts.poppins(
                                      color: theme.primaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Biaya Konsultasi",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w400)),
                          Text("Rp. xx.xxx / sesi",
                              style: GoogleFonts.poppins(
                                  color: theme.primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SessionPaymentPage.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: theme.primaryColor,
                          ),
                          child: Text(
                            "Konsultasi Sekarang",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
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
