import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/models/organization_model.dart';
import 'package:upgrading/views/search/organisasi/detail_organisasi_page.dart';
import 'package:upgrading/widgets/custom_card.dart';
import 'package:upgrading/widgets/organisasi_card.dart';

import '../../../core/constant.dart';
import '../../../services/organzation_service.dart';

class OrganisasiPage extends StatefulWidget {
  static const routeName = "/organisasi";

  const OrganisasiPage({super.key});

  @override
  State<OrganisasiPage> createState() => _OrganisasiPageState();
}

class _OrganisasiPageState extends State<OrganisasiPage> {
  final TextEditingController filterC = TextEditingController();

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
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text("Organization",
              // textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: 1,
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
        body: Column(
          children: [
            Container(
              color: theme.primaryColor,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomCard(imagePath: "assets/images/organisasi-icon.png", title: "Organization", subtitle: "Develop yourself and achieve various things experience by joining to the organization of your choice"),
              ),
            ),
            Container(height: 12, color: theme.primaryColor),
            Container(
              color: theme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(children: [
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search, color: theme.primaryColor),
                              const SizedBox(width: 4),
                              Expanded(
                                // TODO: BUG Search
                                child: TextField(
                                  controller: filterC,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF606060),
                                    ),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF0A0A0A)),
                                  ),
                                  obscureText: false,
                                  enableSuggestions: true,
                                  autocorrect: true,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(width: 8),
                  Container(
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings, color: theme.primaryColor),
                      )),
                ]),
              ),
            ),
            Container(
              height: 20,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: theme.primaryColor,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: FutureBuilder<QuerySnapshot<Object?>>(
                future: OrganizationService().getOrganizations(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Organisasi> organisasis = [];
                    snapshot.data!.docs.forEach((element) {
                      Organisasi organisasi = Organisasi.fromMap(
                          element.data() as Map<String, dynamic>, element.id);
                      organisasis.add(organisasi);
                    });
                    return ListView.builder(
                      itemCount: organisasis.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DetailOrganisasiPage.routeName,
                                  arguments: organisasis[index]);
                            },
                            child:
                                OrganisasiCard(organisasi: organisasis[index]));
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ))
          ],
        ));
  }
}
