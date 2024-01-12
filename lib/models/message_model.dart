class Message {
  final String message;
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String createdAt;

  Message({
    required this.message,
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'createdAt': createdAt,
    };
  }
}
