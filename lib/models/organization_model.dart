import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Organisasi {
  final String uid;
  final String nama;
  final String penyelenggara;
  final Future<String> logoUrl;
  final String openRegist;
  final String closeRegist;
  final String deskripsi;
  final String goals;
  final String benefit;
  final String activity;
  final List<dynamic> reviews;
  final List<dynamic> faqs;

  Organisasi({
    required this.uid,
    required this.nama,
    required this.penyelenggara,
    required this.logoUrl,
    required this.openRegist,
    required this.closeRegist,
    required this.deskripsi,
    required this.goals,
    required this.benefit,
    required this.activity,
    required this.reviews,
    required this.faqs,
  });

  factory Organisasi.fromMap(Map<String, dynamic> map, String id) {
    return Organisasi(
      uid: id,
      nama: map['nama'] ?? '',
      penyelenggara: map['penyelenggara'] ?? '',
      logoUrl: FirebaseStorage.instance
          .ref()
          .child((map['logo'] as DocumentReference).path)
          .getDownloadURL(),
      openRegist: map['open-registration'] ?? '',
      closeRegist: map['close-registration'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
      goals: map['goals'] ?? '',
      benefit: map['benefit'] ?? '',
      activity: map['activity'] ?? '',
      reviews: map['reviews'] ?? [],
      faqs: map['faqs'] ?? [],
    );
  }
}
