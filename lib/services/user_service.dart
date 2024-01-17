import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final String? uid;
  UserService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  Future savingUserData(String fullName, String email) async {
    return userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "chats": [],
      "beasiswa_group_chats": [],
      "organisasi_group_chats": [],
      "profilePic": "",
      "uid": uid
    });
  }

  Future<QuerySnapshot<Object?>> gettingUserData(String email) async {
    Future<QuerySnapshot<Object?>> snapshot =
        userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future<DocumentSnapshot<Object?>> getAllChatRooms() async {
    Future<DocumentSnapshot<Object?>> snapshot = userCollection.doc(uid).get();
    return snapshot;
  }
}
