import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/models/scholarships_model.dart';
import 'package:upgrading/services/organzation_service.dart';
import 'package:upgrading/services/scholarship_service.dart';
import 'package:upgrading/services/user_service.dart';
import 'package:upgrading/views/search/organisasi/organisasi_page.dart';
import 'package:upgrading/views/upgrading/konsultasi/konsultasi_page.dart';
import 'package:upgrading/views/upgrading/video_persiapan/video_persiapan_page.dart';
import 'package:upgrading/widgets/custom_card.dart';
import 'package:upgrading/widgets/custom_item.dart';

import '../../core/constant.dart';
import '../../models/organization_model.dart';
import '../search/beasiswa/beasiswa_page.dart';
import '../search/beasiswa/detail_beasiswa_page.dart';
import '../search/organisasi/detail_organisasi_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: 0,
            onTap: (index) {
              Navigator.pushNamed(context, pages[index]);
            },
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: theme.primaryColor),
            selectedItemColor: theme.primaryColor,
            selectedLabelStyle: GoogleFonts.poppins(
                color: theme.primaryColor, fontWeight: FontWeight.w400),
            selectedFontSize: 10,
            unselectedIconTheme: IconThemeData(color: theme.focusColor),
            unselectedItemColor: theme.focusColor,
            unselectedLabelStyle: GoogleFonts.poppins(
                color: theme.primaryColor, fontWeight: FontWeight.w400),
            unselectedFontSize: 10,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: 'Community',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.create_new_folder_outlined),
                label: 'Upgrading',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Profile',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: theme.primaryColor,
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              FutureBuilder(
                                  future: UserService().gettingUserData(
                                      FirebaseAuth.instance.currentUser!.email
                                          .toString()),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        'Hello, ${(snapshot.data!.docs[0].data() as Map<String, dynamic>)['fullName']}!',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      );
                                    }
                                    return Container();
                                  })
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Improve your skill and value here',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Stack(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        color: theme.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SizedBox(
                        height: 120,
                        child: ListView.builder(
                            itemCount: freeFeatures.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          freeFeatures[index]['routeName']!);
                                    },
                                    child: CustomCard(
                                        imagePath: freeFeatures[index]
                                            ['imagePath']!,
                                        title: freeFeatures[index]['title']!,
                                        subtitle: freeFeatures[index]
                                            ['subtitle']!)),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Scholarships',
                        style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    height: 90,
                    child: FutureBuilder<QuerySnapshot<Object?>>(
                        future: ScholarshipsService().getScholarships(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Beasiswa> beasiswas = [];
                            snapshot.data!.docs.forEach((element) {
                              Beasiswa beasiswa = Beasiswa.fromMap(
                                  element.data() as Map<String, dynamic>,
                                  element.id);
                              beasiswas.add(beasiswa);
                            });
                            return ListView.builder(
                                itemCount: beasiswas.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              DetailBeasiswaPage.routeName,
                                              arguments: beasiswas[index]);
                                        },
                                        child: CustomItem(
                                            imageUrl: beasiswas[index].logoUrl,
                                            title: beasiswas[index].nama,
                                            subtitle: beasiswas[index]
                                                .penyelenggara)),
                                  );
                                });
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, BeasiswaPage.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignInside,
                            color: Color(0xFFAAC0CD),
                          ),
                        ),
                      ),
                      child: Text(
                        'More',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Organization',
                        style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 165,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FutureBuilder<QuerySnapshot<Object?>>(
                      future: OrganizationService().getOrganizations(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Organisasi> organisasis = [];
                          snapshot.data!.docs.forEach((element) {
                            Organisasi organisasi = Organisasi.fromMap(
                                element.data() as Map<String, dynamic>,
                                element.id);
                            organisasis.add(organisasi);
                          });
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: organisasis.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          DetailOrganisasiPage.routeName,
                                          arguments: organisasis[index]);
                                    },
                                    child: CustomItem(
                                        imageUrl: organisasis[index].logoUrl,
                                        title: organisasis[index].nama,
                                        subtitle:
                                            organisasis[index].penyelenggara)),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, OrganisasiPage.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignInside,
                            color: Color(0xFFAAC0CD),
                          ),
                        ),
                      ),
                      child: Text(
                        'More',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Organization',
                        style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, VideoPersiapanPage.routeName);
                        },
                        child: Container(
                          width: 148,
                          height: 148,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignInside,
                                color: Color(0xFFAAC0CD),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/video-preparation-icon.png",
                                height: 96,
                                width: 96,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Preparation Video',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: theme.primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, KonsultasiPage.routeName);
                        },
                        child: Container(
                          width: 148,
                          height: 148,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignInside,
                                color: Color(0xFFAAC0CD),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/consultation-icon.png",
                                height: 96,
                                width: 96,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Consultation',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: theme.primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
