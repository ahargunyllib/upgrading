import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Mentor {
  final String uid;
  final String email;
  final String fullName;
  final Future<String> profileUrl;
  final Beasiswa beasiswa;
  final Pengalaman pengalaman;
  final Pendidikan pendidikan;
  final int biaya;
  final String deskripsi;

  Mentor({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.profileUrl,
    required this.beasiswa,
    required this.pengalaman,
    required this.pendidikan,
    required this.biaya,
    required this.deskripsi,
  });

  factory Mentor.fromMap(Map<String, dynamic> map, String id) {
    return Mentor(
      uid: id,
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      profileUrl: FirebaseStorage.instance
          .ref()
          .child((map['profileUrl'] as DocumentReference).path)
          .getDownloadURL(),
      beasiswa: Beasiswa.fromMap(map['beasiswa'] ?? {}),
      pengalaman: Pengalaman.fromMap(map['pengalaman'] ?? {}),
      pendidikan: Pendidikan.fromMap(map['pendidikan'] ?? {}),
      biaya: map['biaya'] ?? 0,
      deskripsi: map['deskripsi'] ?? '',
    );
  }
}

class Beasiswa {
  final Future<String> beasiswaLogo;
  final String penyelenggara;
  final String nama;

  Beasiswa(
      {required this.beasiswaLogo,
      required this.penyelenggara,
      required this.nama});

  factory Beasiswa.fromMap(Map<String, dynamic> map) {
    return Beasiswa(
      beasiswaLogo: FirebaseStorage.instance
          .ref()
          .child((map['beasiswaLogo'] as DocumentReference).path)
          .getDownloadURL(),
      penyelenggara: map['penyelenggara'] ?? '',
      nama: map['nama'] ?? '',
    );
  }
}

class Pengalaman {
  final String jabatan;
  final Future<String> universitasLogo;
  final String universitas;
  final String waktu;

  Pengalaman(
      {required this.jabatan,
      required this.universitasLogo,
      required this.universitas,
      required this.waktu});

  factory Pengalaman.fromMap(Map<String, dynamic> map) {
    return Pengalaman(
      jabatan: map['jabatan'] ?? '',
      universitasLogo: FirebaseStorage.instance
          .ref()
          .child((map['universitasLogo'] as DocumentReference).path)
          .getDownloadURL(),
      universitas: map['universitas'] ?? '',
      waktu: map['waktu'] ?? '',
    );
  }
}

class Pendidikan {
  final String jurusan;
  final String universitas;
  final Future<String> universitasLogo;
  final String waktu;

  Pendidikan(
      {required this.jurusan,
      required this.universitas,
      required this.universitasLogo,
      required this.waktu});

  factory Pendidikan.fromMap(Map<String, dynamic> map) {
    return Pendidikan(
      jurusan: map['jurusan'] ?? '',
      universitas: map['universitas'] ?? '',
      universitasLogo: FirebaseStorage.instance
          .ref()
          .child((map['universitasLogo'] as DocumentReference).path)
          .getDownloadURL(),
      waktu: map['waktu'] ?? '',
    );
  }
}
