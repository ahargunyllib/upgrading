import 'package:cloud_firestore/cloud_firestore.dart';

class VideoService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getVideo(String id) {
    Future<DocumentSnapshot<Map<String, dynamic>>> snapshot =
        db.collection('upgrading-videos').doc(id).get();
    return snapshot;
  }

  Future<QuerySnapshot<Object?>> getVideos() {
    Future<QuerySnapshot<Map<String, dynamic>>> snapshot =
        db.collection('upgrading-videos').get();
    return snapshot;
  }
}