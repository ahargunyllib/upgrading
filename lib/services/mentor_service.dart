import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/mentor_model.dart';

class MentorService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  printAllDoc() async {
    db.collection("mentors").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          Mentor mentor = Mentor.fromMap(docSnapshot.data(), docSnapshot.id);
          print('${mentor.uid} => ${mentor.fullName}, ${mentor.beasiswa.nama}');
        }
      },
    );
  }

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
