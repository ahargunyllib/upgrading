class User {
  final String uid;
  final String email;
  final String fullName;
  final String universitas;
  final String jurusan;
  final int angkatan;
  final String profileUrl;
  final bool statusSubscription;
  final List<String> mentorChats;
  final List<String> scholarshipCommunities;
  final List<String> organizationCommunities;

  User({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.universitas,
    required this.jurusan,
    required this.angkatan,
    required this.profileUrl,
    required this.statusSubscription,
    required this.mentorChats,
    required this.scholarshipCommunities,
    required this.organizationCommunities,
  });

  // Add fromJson and toJson methods if needed for serialization
}
