import 'package:cloud_firestore/cloud_firestore.dart';

class OrganizationService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getOrganization(String id) {
    Future<DocumentSnapshot<Map<String, dynamic>>> snapshot =
        db.collection('organizations').doc(id).get();
    return snapshot;
  }

  Future<QuerySnapshot<Object?>> getOrganizations() {
    Future<QuerySnapshot<Map<String, dynamic>>> snapshot =
        db.collection('organizations').get();
    return snapshot;
  }
}
