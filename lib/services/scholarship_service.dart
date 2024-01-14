import 'package:cloud_firestore/cloud_firestore.dart';

class ScholarshipsService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getScholarship(String id) {
    Future<DocumentSnapshot<Map<String, dynamic>>> snapshot =
        db.collection('scholarships').doc(id).get();
    return snapshot;
  }

  Future<QuerySnapshot<Object?>> getScholarships() {
    Future<QuerySnapshot<Map<String, dynamic>>> snapshot =
        db.collection('scholarships').get();
    return snapshot;
  }
}
