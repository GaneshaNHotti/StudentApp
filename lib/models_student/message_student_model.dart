import 'user_student_model.dart';
class Message {
  final User sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: DEPCSE,
    time: '5:30 PM',
    text: 'Good evening, Important circular.',
    unread: true,
  ),
  Message(
    sender: Proctor,
    time: '4:30 PM',
    text: 'Kindly revert back.',
    unread: true,
  ),

];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: DEPCSE,
    time: '5:30 PM',
    text: 'Good evening, Important circular',
    unread: true,
  ),
  Message(
    sender: Proctor,
    time: '4:30 PM',
    text: 'Kindly revert back.',
    unread: true,
  ),
  
];