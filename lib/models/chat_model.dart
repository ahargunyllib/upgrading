class Chat {
  final String uid;
  final String mentorId;
  final String userId;
  final String startedTime;
  final String endedTime;

  Chat({
    required this.uid,
    required this.mentorId,
    required this.userId,
    required this.startedTime,
    required this.endedTime,
  });

  // Add fromJson and toJson methods if needed for serialization
}
