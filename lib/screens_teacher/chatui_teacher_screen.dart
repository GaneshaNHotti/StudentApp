/*this page isnt decided yet*/
import 'package:flutter/material.dart';
import 'package:intership/main.dart';
import 'package:intership/models_teacher/message_teacher_model.dart';
import 'package:intership/screens_student/chatui_student_screen.dart';
import 'package:intership/screens_teacher/addchats_teacher_screen.dart';
import 'package:intership/screens_teacher/chat_teacher_screen.dart';

class ChatUi_teacher extends StatefulWidget {
  const ChatUi_teacher({Key? key}) : super(key: key);

  @override
  _ChatUiState createState() => _ChatUiState();
}

class _ChatUiState extends State<ChatUi_teacher> {
  late Choice _selectedChoice;

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  List<Choice> choices = <Choice>[
    Choice(title: 'message individual student', onPressed: () {}, icon: Icons.person),
    Choice(title: 'message sem student', onPressed: () {}, icon: Icons.person),
    Choice(title: 'message all student', onPressed: () {}, icon: Icons.group),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: null,
          ),
        ],
      ),
      body: Stack(
        children: [
          // ListView.builder(
          //   itemCount: chats.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     final Message chat = chats[index];
          //     return GestureDetector(
          //       onTap: () => Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (_) => ChatScreen_teacher(
          //             user: chat.sender,
          //           ),
          //         ),
          //       ),
          //       child: Container(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 20,
          //           vertical: 15,
          //         ),
          //         child: Row(
          //           children: <Widget>[
          //             Container(
          //               padding: EdgeInsets.all(2),
          //               decoration: chat.unread
          //                   ? BoxDecoration(
          //                       borderRadius:
          //                           BorderRadius.all(Radius.circular(40)),
          //                       border: Border.all(
          //                         width: 2,
          //                         color: Theme.of(context).primaryColor,
          //                       ),
          //                       // shape: BoxShape.circle,
          //                       boxShadow: [
          //                         BoxShadow(
          //                           color: Colors.grey.withOpacity(0.5),
          //                           spreadRadius: 2,
          //                           blurRadius: 5,
          //                         ),
          //                       ],
          //                     )
          //                   : BoxDecoration(
          //                       shape: BoxShape.circle,
          //                       boxShadow: [
          //                         BoxShadow(
          //                           color: Colors.grey.withOpacity(0.5),
          //                           spreadRadius: 2,
          //                           blurRadius: 5,
          //                         ),
          //                       ],
          //                     ),
          //               child: CircleAvatar(
          //                 radius: 35,
          //                 backgroundImage: AssetImage(
          //                   chat.sender.imageUrl,
          //                 ),
          //               ),
          //             ),
          //             Container(
          //               width: MediaQuery.of(context).size.width * 0.65,
          //               padding: EdgeInsets.only(
          //                 left: 20,
          //               ),
          //               child: Column(
          //                 children: <Widget>[
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: <Widget>[
          //                       Row(
          //                         children: <Widget>[
          //                           Text(
          //                             chat.sender.name,
          //                             style: TextStyle(
          //                               fontSize: 16,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                           chat.sender.isOnline
          //                               ? Container(
          //                                   margin:
          //                                       const EdgeInsets.only(left: 5),
          //                                   width: 7,
          //                                   height: 7,
          //                                   decoration: BoxDecoration(
          //                                     shape: BoxShape.circle,
          //                                     color: Theme.of(context)
          //                                         .primaryColor,
          //                                   ),
          //                                 )
          //                               : Container(
          //                                   child: null,
          //                                 ),
          //                         ],
          //                       ),
          //                       Text(
          //                         chat.time,
          //                         style: TextStyle(
          //                           fontSize: 11,
          //                           fontWeight: FontWeight.w300,
          //                           color: Colors.black54,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   Container(
          //                     alignment: Alignment.topLeft,
          //                     child: Text(
          //                       chat.text,
          //                       style: TextStyle(
          //                         fontSize: 13,
          //                         color: Colors.black54,
          //                       ),
          //                       overflow: TextOverflow.ellipsis,
          //                       maxLines: 2,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
          Positioned(
            bottom: 30,
            right: 30,
            child: PopupMenuButton<Choice>(
              icon: Icon(
                Icons.add_circle,
                size: 60,
                color: Colors.blue[900],
              ),
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: ChoiceCard(
                      choice: choice,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Choice {
  Choice({required this.title, required this.icon, required this.onPressed});
  String title;
  IconData icon;
  Function onPressed;
}

class ChoiceCard extends StatelessWidget {
  ChoiceCard({Key? key, required this.choice}) : super(key: key);

  Choice choice;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Icon(choice.icon),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            choice.title,
            style: TextStyle(fontSize: 15),
          )),
        ],
      ),
      onPressed: null,
    );
  }
}
