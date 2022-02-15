import 'package:flutter/material.dart';
import 'package:intership/Helper/chatScreen.dart';
import 'package:intership/chatWidgets/HomeScreen.dart';

import 'package:intership/screens_student/mainhome_student_screen.dart';
import 'package:intership/screens_student/allchat_student_screen.dart';

import 'package:intership/screens_student/chatui_student_screen.dart';

class Home_student extends StatefulWidget {
  const Home_student({Key? key}) : super(key: key);

  @override
  _Home_studentState createState() => _Home_studentState();
}

class _Home_studentState extends State<Home_student> {
  int currentindex = 0;
  final tabs = [
    MainHome_student(),
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
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text("Chat"),
              backgroundColor: Colors.blue[900])
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
