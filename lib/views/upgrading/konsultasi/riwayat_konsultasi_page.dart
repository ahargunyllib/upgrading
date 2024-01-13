import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upgrading/services/mentor_service.dart';
import 'package:upgrading/services/user_service.dart';
import 'package:upgrading/widgets/konsultan_item.dart';

import '../../../models/mentor_model.dart';

class RiwayatKonsultasiPage extends StatelessWidget {
  const RiwayatKonsultasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return FutureBuilder(
        future: UserService(uid: currentUserId).getAllChatRooms(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<String> receiverIds = [];
            // print(snapshot.data!.data());
            (snapshot.data!.data() as Map<String, dynamic>)['chats']
                .forEach((chatRoomId) {
              String userId = chatRoomId.split("_")[0];
              String otherUserId = chatRoomId.split("_")[1];
              if (userId == currentUserId) {
                receiverIds.add(otherUserId);
              } else {
                receiverIds.add(userId);
              }
            });
            return _buildRiwayatKonsultan(receiverIds);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }

  Widget _buildRiwayatKonsultan(List<String> receiverIds) {
    return ListView.builder(
      itemCount: receiverIds.length,
      padding: const EdgeInsets.symmetric(vertical: 4),
      itemBuilder: (context, index) {
        return FutureBuilder(
            future: MentorService().getMentor(receiverIds[index]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Mentor mentor = Mentor.fromMap(
                    snapshot.data!.data() as Map<String, dynamic>,
                    snapshot.data!.id);
                return KonsultanItem(mentor: mentor);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      },
    );
  }
}
