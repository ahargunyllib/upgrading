import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/views/upgrading/video_persiapan/list_video_page.dart';

import '../../../core/constant.dart';
import '../../../models/videos_model.dart';
import '../../../services/video_service.dart';
import '../../../widgets/video_card.dart';

class CategoryVideoPage extends StatelessWidget {
  static const routeName = '/category-video';
  const CategoryVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String topic = ModalRoute.of(context)!.settings.arguments as String;

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
          title: Text(topic,
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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            const SizedBox(height: 12),
            Expanded(
              child: FutureBuilder(
                  future: VideoService().getVideos(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Video> videos = [];
                      snapshot.data!.docs.forEach((element) {
                        Video video = Video.fromMap(
                            element.data() as Map<String, dynamic>, element.id);
                        videos.add(video);
                      });
                      if (topic == "Essay Writing") {
                        return ListView.builder(
                            itemCount: videos.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, ListVideoPage.routeName,
                                      arguments: videos[index]),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: VideoCard(video: videos[index]),
                                  ));
                            });
                      } else {
                        return Column(
                          children: [
                            Image.asset("assets/images/coming-soon-icon.png"),
                            const SizedBox(height: 12),
                            Text("COMING",
                                style: GoogleFonts.poppins(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: theme.primaryColor,
                                    height: 0.8)),
                            Text("SOON",
                                style: GoogleFonts.poppins(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: theme.primaryColor,
                                    letterSpacing: 16.8,
                                    height: 0.8)),
                          ],
                        );
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ));
  }
}
