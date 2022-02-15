import 'package:flutter/material.dart';
import 'package:intership/Helper/chatScreen.dart';
import 'package:intership/chatWidgets/HomeScreen.dart';
import 'package:intership/screens_teacher/chat_teacher_screen.dart';
import 'package:intership/screens_teacher/chatui_teacher_screen.dart';

import 'package:intership/screens_teacher/mainhome_teacher_screen.dart';

class Home_teacher extends StatefulWidget {
  const Home_teacher({ Key? key }) : super(key: key);

  @override
  _Home_teacherState createState() => _Home_teacherState();
}

class _Home_teacherState extends State<Home_teacher> {

  int currentindex=0;
  final tabs=[
   MainHome_teacher(),
    ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.redAccent),

       BottomNavigationBarItem(
            icon:Icon(Icons.chat),
            title: Text("Chat"),
            backgroundColor: Colors.blue[900])
        ],
        onTap:(index){
          setState(() {
            currentindex=index;
          });
        } ,
        ),
        
    );
  }
}