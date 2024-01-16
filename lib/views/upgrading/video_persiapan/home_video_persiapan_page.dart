import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/services/video_service.dart';
import 'package:upgrading/views/upgrading/video_persiapan/category_video_page.dart';
import 'package:upgrading/widgets/custom_card.dart';
import 'package:upgrading/widgets/video_card.dart';

import '../../../core/constant.dart';
import '../../../models/videos_model.dart';
import 'list_video_page.dart';

class HomeVideoPersiapanPage extends StatelessWidget {
  static const routeName = "/home-video-persiapan";
  const HomeVideoPersiapanPage({super.key});

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
        title: Text("Preparation Video",
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
          currentIndex: 3,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: theme.primaryColor,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomCard(imagePath: "assets/images/video-preparation-icon.png", title: "Preparation Video", subtitle: "Access video content of scholarship preparation or organization that you want"),
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Video Topics',
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CategoryVideoPage.routeName,
                          arguments: "English Language");
                    },
                    child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/bahasa-inggris-logo.png"),
                                const SizedBox(height: 8),
                                Text(
                                  'English\nLanguage',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: theme.primaryColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ]),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CategoryVideoPage.routeName,
                          arguments: "Essay Writing");
                    },
                    child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/penulisan-esai-logo.png"),
                                const SizedBox(height: 8),
                                Text(
                                  'Essay\nWriting',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: theme.primaryColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ]),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CategoryVideoPage.routeName,
                          arguments: "Public Speaking");
                    },
                    child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/public-speaking-logo.png"),
                                const SizedBox(height: 8),
                                Text(
                                  'Public\nSpeaking',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: theme.primaryColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ]),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CategoryVideoPage.routeName,
                          arguments: "Interview");
                    },
                    child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/wawancara-logo.png"),
                                const SizedBox(height: 8),
                                Text(
                                  'Interview',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: theme.primaryColor,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ]),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Populer Videos',
                      style: GoogleFonts.poppins(
                        color: theme.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 12),
            FutureBuilder(
                future: VideoService().getVideos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Video> videos = [];
                    snapshot.data!.docs.forEach((element) {
                      Video video = Video.fromMap(
                          element.data() as Map<String, dynamic>, element.id);
                      videos.add(video);
                    });
                    return InkWell(onTap: () => Navigator.pushNamed(context, ListVideoPage.routeName, arguments: videos[0]),child: VideoCard(video: videos[0]));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            const SizedBox(height: 32)
          ],
        ),
      ),
    );
  }
}
