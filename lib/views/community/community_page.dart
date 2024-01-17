import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/views/community/community_chat_page.dart';
import 'package:upgrading/widgets/custom_card.dart';

import '../../../core/constant.dart';
import '../../models/scholarships_model.dart';
import '../../services/scholarship_service.dart';
import '../../services/user_service.dart';
import '../../widgets/custom_item.dart';

class CommunityPage extends StatefulWidget {
  static const routeName = "/community";
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
        title: Text("Community",
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
          currentIndex: 2,
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
              child: CustomCard(
                  imagePath: "assets/images/community-icon.png",
                  title: "Community",
                  subtitle:
                      "Gather and share information with those who have the same goals as you"),
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
          TabBar(
              labelStyle: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF9E9E9E),
              ),
              indicatorColor: theme.primaryColor,
              indicatorWeight: 3,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              labelColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  child: Text(
                    "Scholarship Community",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  child: Text(
                    "Organization Community",
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
          Flexible(
            fit: FlexFit.loose,
            child: TabBarView(controller: _tabController, children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: FutureBuilder(
                    future:
                        UserService(uid: FirebaseAuth.instance.currentUser!.uid)
                            .getAllChatRooms(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<String> groupIds = [];
                        (snapshot.data!.data()
                                as Map<String, dynamic>)['beasiswa_group_chats']
                            .forEach((chatRoomId) {
                          groupIds.add(chatRoomId);
                        });

                        return ListView.builder(
                            itemCount: groupIds.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder(
                                  future: ScholarshipsService()
                                      .getScholarship(groupIds[index]),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      Beasiswa beasiswa = Beasiswa.fromMap(
                                          snapshot.data!.data()
                                              as Map<String, dynamic>,
                                          snapshot.data!.id);
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  CommunityChatPage.routeName,
                                                  arguments: {
                                                    'groupId': beasiswa.uid,
                                                    'imageUrl':
                                                        beasiswa.logoUrl,
                                                    'groupName': beasiswa.nama,
                                                    'type': 'beasiswa'
                                                  });
                                            },
                                            child: CustomItem(
                                                imageUrl: beasiswa.logoUrl,
                                                title: beasiswa.nama,
                                                subtitle:
                                                    beasiswa.penyelenggara)),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  });
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
