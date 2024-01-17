import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrading/services/group_chat_service.dart';

class CommunityChatPage extends StatefulWidget {
  static const routeName = "/community-chat";
  const CommunityChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  CommunityChatPageState createState() => CommunityChatPageState();
}

class CommunityChatPageState extends State<CommunityChatPage> {
  final TextEditingController messageC = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String groupId = (ModalRoute.of(context)!.settings.arguments!
        as Map<String, dynamic>)['groupId'] as String;
    final Future<String> imageUrl = (ModalRoute.of(context)!.settings.arguments!
        as Map<String, dynamic>)['imageUrl'] as Future<String>;
    final String groupName = (ModalRoute.of(context)!.settings.arguments!
        as Map<String, dynamic>)['groupName'] as String;
    final String type = (ModalRoute.of(context)!.settings.arguments!
        as Map<String, dynamic>)['type'] as String;

    return Scaffold(
      bottomNavigationBar: null,
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
              future: imageUrl,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Color(0xFFAAC0CD),
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: FutureBuilder(
                          future: imageUrl,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Image.network(
                                snapshot.data!,
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              );
                            }
                            return Container();
                          },
                        ),
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
            Expanded(
              child: Text(groupName,
                  softWrap: true,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: StreamBuilder<QuerySnapshot>(
                stream: GroupChatService().getMessages(groupId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                        children: snapshot.data!.docs.map((document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      var alignment =
                          (data['senderId'] == firebaseAuth.currentUser!.uid)
                              ? Alignment.centerRight
                              : Alignment.centerLeft;

                      return Container(
                          alignment: alignment,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
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
                              const SizedBox(width: 4),
                              Column(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: ShapeDecoration(
                                      color: theme.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'N',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
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
                              ),
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
              topRight: Radius.circular(16),
            ),
            color: theme.primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(children: [
              InkWell(
                onTap: () {},
                child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.attach_file, color: theme.primaryColor)),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // TODO: BUG text field size
                            child: SizedBox(
                              height: 16,
                              child: TextField(
                                controller: messageC,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  border: InputBorder.none,
                                  hintText: "Write a message",
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    // height: 0.12,
                                  ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    // height: 0.12,
                                  ),
                                ),
                                obscureText: false,
                                enableSuggestions: true,
                                autocorrect: true,
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () async {
                                if (messageC.text.isNotEmpty) {
                                  await GroupChatService().sendMessage(
                                      messageC.text, groupId, type);
                                }
                                messageC.clear();
                              },
                              child: const Icon(Icons.send,
                                  color: Color(0xFFAAC0CD))),
                        ],
                      ),
                    )),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
