import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upgrading/models/message_model.dart';

class GroupChatService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future sendMessage(String message, String groupId, String type) async {
    final String senderId = firebaseAuth.currentUser!.uid;
    final String senderEmail = firebaseAuth.currentUser!.email.toString();
    final Timestamp createdAt = Timestamp.now();

    Message newMessage = Message(
        message: message,
        senderId: senderId,
        senderEmail: senderEmail,
        receiverId: '',
        createdAt: createdAt);

    await firestore
        .collection('chat_rooms')
        .doc(groupId)
        .collection('messages')
        .add(newMessage.toMap());

    if (type == 'beasiswa') {
      await firestore.collection('users').doc(senderId).update({
        'beasiswa_group_chats': FieldValue.arrayUnion([groupId])
      });
    } else if (type == 'organisasi') {
      await firestore.collection('users').doc(senderId).update({
        'organisasi_group_chats': FieldValue.arrayUnion([groupId])
      });
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String groupId) {
    return firestore
        .collection('chat_rooms')
        .doc(groupId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots();
  }
}
