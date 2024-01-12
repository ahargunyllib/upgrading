import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upgrading/models/message_model.dart';

class ChatService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future sendMessage(String message, String receiverId) async {
    final String senderId = firebaseAuth.currentUser!.uid;
    final String senderEmail = firebaseAuth.currentUser!.email.toString();
    final String createdAt = Timestamp.now().toString();

    Message newMessage = Message(
        message: message,
        senderId: senderId,
        senderEmail: senderEmail,
        receiverId: receiverId,
        createdAt: createdAt);

    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots();
  }
}
