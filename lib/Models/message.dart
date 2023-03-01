class Message {
  final String message;
  final String date;
  final String id;

  Message({required this.message, required this.date, required this.id});

  factory Message.fromFireStore(snapshot) {
    final data = snapshot.data();
    return Message(
        message: data['message'], date: data['date'], id: data['id']);
  }

  static Map<String, dynamic> toFireStore(Message mes) {
    return {
      'message': mes.message,
      'date': mes.date,
      'id': mes.id,
    };
  }
}
