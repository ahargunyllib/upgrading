import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Video {
  final String uid;
  final String channel;
  final String judul;
  final String topic;
  final Future<String> thumbnail;
  final Future<String> videos;

  Video(
      {required this.uid,
      required this.channel,
      required this.judul,
      required this.thumbnail,
      required this.topic,
      required this.videos});

  factory Video.fromMap(Map<String, dynamic> map, String id) {
    return Video(
      uid: id,
      channel: map['channel'] ?? '',
      judul: map['judul'] ?? '',
      topic: map['topic'] ?? '',
      thumbnail: FirebaseStorage.instance
          .ref()
          .child((map['thumbnail'] as DocumentReference).path)
          .getDownloadURL(),
      videos: FirebaseStorage.instance
          .ref()
          .child((map['videos'][0] as DocumentReference).path)
          .getDownloadURL(),
    );
  }
}
