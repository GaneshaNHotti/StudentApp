import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intership/screens_student/Signin_student_screen.dart';
import 'package:intership/screens_teacher/signin_teacher_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

const primaryColor = Colors.redAccent;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Image.asset(
              'lib/assets/college.png',
              fit: BoxFit.cover,
              height: 48,
            ),
            bottom: const TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 8, color: Colors.orange)),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    "Students",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Staff",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Signin_student(),
              Signin_teacher(),
            ],
          ),
        ),
      ),
    );
  }
}
