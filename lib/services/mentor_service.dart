import 'package:cloud_firestore/cloud_firestore.dart';

class MentorService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getMentor(String id) {
    Future<DocumentSnapshot<Map<String, dynamic>>> snapshot =
        db.collection('mentors').doc(id).get();
    return snapshot;
  }

  Future<QuerySnapshot<Object?>> getMentors() {
    Future<QuerySnapshot<Map<String, dynamic>>> snapshot =
        db.collection('mentors').get();
    return snapshot;
  }
}
