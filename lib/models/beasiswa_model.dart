class Beasiswa {
  final String uid;
  final String nama;
  final String penyelenggara;
  final String logoUrl;
  final String openRegist;
  final String closeRegist;
  final String deskripsi;
  final String komponen;
  final String persyaratan;
  final String dokumen;
  final List<String> users;

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
    required this.users,
  });

  factory Beasiswa.fromJson(Map<String, dynamic> json) {
    return Beasiswa(
      uid: json['uid'],
      nama: json['nama'],
      penyelenggara: json['penyelenggara'],
      logoUrl: json['logoUrl'],
      openRegist: json['openRegist'],
      closeRegist: json['closeRegist'],
      deskripsi: json['deskripsi'],
      komponen: json['komponen'],
      persyaratan: json['persyaratan'],
      dokumen: json['dokumen'],
      users: List<String>.from(json['users']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'nama': nama,
      'penyelenggara': penyelenggara,
      'logoUrl': logoUrl,
      'openRegist': openRegist,
      'closeRegist': closeRegist,
      'deskripsi': deskripsi,
      'komponen': komponen,
      'persyaratan': persyaratan,
      'dokumen': dokumen,
      'users': users,
    };
  }
}
