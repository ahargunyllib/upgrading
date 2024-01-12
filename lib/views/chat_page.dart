import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/mentor_model.dart';
import '../services/chat_service.dart';

class ChatPage extends StatefulWidget {
  static const routeName = "/chat";
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageC = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final Mentor mentor = ModalRoute.of(context)!.settings.arguments! as Mentor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        ),
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
        title: Row(
          children: [
            FutureBuilder(
              future: mentor.profileUrl,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CircleAvatar(
                      child: Image.network(
                    snapshot.data!,
                    fit: BoxFit.fill,
                    width: 40,
                    height: 40,
                  ));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const Center(
                    child: Text("error"),
                  );
                }
              },
            ),
            const SizedBox(width: 8),
            Text(mentor.fullName,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: size.height,
                child: StreamBuilder<QuerySnapshot>(
                    stream: ChatService()
                        .getMessages(mentor.uid, firebaseAuth.currentUser!.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                            children: snapshot.data!.docs.map((document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          var alignment = (data['senderId'] ==
                                  firebaseAuth.currentUser!.uid)
                              ? Alignment.centerRight
                              : Alignment.centerLeft;

                          return Container(
                              alignment: alignment,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: theme.primaryColor,
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Text(data['message'],
                                          textAlign: TextAlign.justify,
                                          softWrap: true,
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400))),
                                  const SizedBox(height: 8),
                                  Text(
                                    '9:30',
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF404040),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      height: 0.12,
                                    ),
                                  ),
                                  const SizedBox(height: 16)
                                ],
                              ));
                        }).toList());
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  color: theme.primaryColor),
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFAAC0CD),
                    ),
                  ),
                  child: TextFormField(
                    controller: messageC,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tuliskan pesanmu",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF9E9E9E),
                      ),
                      contentPadding: const EdgeInsets.only(left: 16),
                    ),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0A0A0A)),
                    ),
                  )),
            ),
            IconButton(
                onPressed: () async {
                  if (messageC.text.isNotEmpty) {
                    await ChatService().sendMessage(messageC.text, mentor.uid);
                  }
                  messageC.clear();
                },
                icon: const Icon(Icons.send, color: Color(0xFFAAC0CD))),
          ]),
        ),
      ),
    );
  }
}
