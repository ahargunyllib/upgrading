import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/models/scholarships_model.dart';
import 'package:upgrading/views/coming_soon_page.dart';
import 'package:upgrading/views/community/community_chat_page.dart';
import 'package:upgrading/widgets/beasiswa_card.dart';

import '../../../core/constant.dart';

class DetailBeasiswaPage extends StatefulWidget {
  static const routeName = "/detail-beasiswa";
  const DetailBeasiswaPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailBeasiswaPageState createState() => _DetailBeasiswaPageState();
}

class _DetailBeasiswaPageState extends State<DetailBeasiswaPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Beasiswa beasiswa =
        ModalRoute.of(context)!.settings.arguments as Beasiswa;
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
        title: Text("Scholarship detail",
            textAlign: TextAlign.center,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 100,
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
                  children: [
                    BeasiswaCard(beasiswa: beasiswa),
                    const SizedBox(height: 32),
                    TabBar(
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        indicator: ShapeDecoration(
                            color: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        // labelColor: theme.primaryColor,
                        controller: _tabController,
                        labelPadding: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        unselectedLabelStyle: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: theme.primaryColor,
                        ),
                        tabs: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              // color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: theme.primaryColor),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Description'),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              // color: theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: theme.primaryColor),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Requirements'),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: ShapeDecoration(
                              // color: theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: theme.primaryColor),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('Document'),
                          )
                        ]),
                  ],
                ),
              ),
            ]),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
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
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("About ${beasiswa.nama}",
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
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: theme.primaryColor,
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 16),
                                Text(beasiswa.deskripsi,
                                    softWrap: true,
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Colors.black,
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
                                Text("Scholarship Components",
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
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: theme.primaryColor,
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 16),
                                Text(
                                    beasiswa.komponen
                                        .replaceAll('\\n', '\n')
                                        .replaceAll('\\t', '\t'),
                                    softWrap: true,
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("General Requirements",
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
                            Text(
                                beasiswa.persyaratan
                                    .replaceAll('\\n', '\n')
                                    .replaceAll('\\t', '\t'),
                                softWrap: true,
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Document Requirements",
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
                            Text(
                                beasiswa.dokumen
                                    .replaceAll('\\n', '\n')
                                    .replaceAll('\\t', '\t'),
                                softWrap: true,
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: SizedBox(
                height: 46,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFAAC0CD)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(CommunityChatPage.routeName, arguments: {
                          'groupId': beasiswa.uid,
                          'imageUrl': beasiswa.logoUrl,
                          'groupName': beasiswa.nama,
                          'type': 'beasiswa'
                        });
                    
                  },
                  child: Text("Join to Community",
                      style: GoogleFonts.poppins(
                          color: theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: SizedBox(
                height: 46,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: theme.primaryColor,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ComingSoonPage.routeName);
                  },
                  child: Text("Register Now",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            )
          ]),
    );
  }
}
