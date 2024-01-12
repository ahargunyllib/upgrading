import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/views/list_konsultan_page.dart';
import 'package:upgrading/views/riwayat_konsultasi_page.dart';

class KonsultasiPage extends StatefulWidget {
  static const routeName = "/konsultasi";
  const KonsultasiPage({super.key});

  @override
  State<KonsultasiPage> createState() => _KonsultasiPageState();
}

class _KonsultasiPageState extends State<KonsultasiPage>
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
        title: Text("Konsultasi",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          Container(
            color: theme.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/consultation-icon.png"),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Konsultasi",
                                  style: GoogleFonts.poppins(
                                      color: theme.primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              Text(
                                "Konsultasi dengan penerima beasiswa atau anggota organisasi yang Anda inginkan",
                                style: GoogleFonts.poppins(
                                    color: theme.primaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                                softWrap: true,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ),
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
                  child: Text("Konsultan Populer"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  child: Text("Daftar Konsultasi"),
                ),
              ]),
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: ListKonsultanPage(),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: RiwayatKonsultasiPage(),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
