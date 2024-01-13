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
      "profilePic": "",
      "uid": uid
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future<QuerySnapshot<Object?>> getAllChatRooms() async {
    Future<QuerySnapshot<Object?>> snapshot = userCollection.doc(uid).collection("chats").get();
    print(snapshot);
    return snapshot;
  }
}
