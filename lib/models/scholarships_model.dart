import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Beasiswa {
  final String uid;
  final String nama;
  final String penyelenggara;
  final Future<String> logoUrl;
  final String openRegist;
  final String closeRegist;
  final String deskripsi;
  final String komponen;
  final String persyaratan;
  final String dokumen;
  // final List<String> users;

  Beasiswa({
    required this.uid,
    required this.nama,
    required this.penyelenggara,
    required this.logoUrl,
    required this.openRegist,
    required this.closeRegist,
    required this.deskripsi,
    required this.komponen,
    required this.persyaratan,
    required this.dokumen,
    // required this.users,
  });

  factory Beasiswa.fromMap(Map<String, dynamic> map, String id) {
    return Beasiswa(
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
      komponen: map['komponen'] ?? '',
      persyaratan: map['persyaratan'] ?? '',
      dokumen: map['dokumen'] ?? '',
      // users: List<String>.from(json['users']),
    );
  }
}
