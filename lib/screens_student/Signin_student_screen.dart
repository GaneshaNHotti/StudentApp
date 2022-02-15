import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intership/Helper/alldata.dart';
import 'package:intership/screens_student/Methods.dart';

import 'package:intership/screens_student/Signup_student_screen.dart';
import 'package:intership/screens_student/chatui_student_screen.dart';
import 'package:intership/screens_student/loading.dart';
import 'package:intership/screens_student/mainhome_student_screen.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intership/screens_student/home_student_screen.dart';

class Signin_student extends StatefulWidget {
  const Signin_student({Key? key}) : super(key: key);

  @override
  _Signin_studentState createState() => _Signin_studentState();
}

final TextEditingController usn = TextEditingController();
final TextEditingController emailcon = TextEditingController();
final TextEditingController password = TextEditingController();
bool isloading = false;

class _Signin_studentState extends State<Signin_student> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isloading
        ? isLoading()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            body: Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0xFF9FA8DA),
                          Color(0xFFFFAB91),
                          Color(0xFF1A237E),
                          Color(0xFF1A237E)
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Card(
                          child: Container(
                            height: 78,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                              controller: usn,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.password),
                                  border: OutlineInputBorder(),
                                  labelText: 'USN',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.amber[50],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Card(
                          child: Container(
                            height: 78,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                              controller: emailcon,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.amber[50],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Card(
                          child: Container(
                            height: 78,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                              controller: password,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.password),
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.amber[50],
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        customButton(size),
                        Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                              Text('Dont have an account?',
                                  style: TextStyle(color: Colors.white)),
                              FlatButton(
                                textColor: Colors.black,
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Signup_student(),
                                      ));
                                },
                              )
                            ]))
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.black54,
          child: Text(
            'SIGN IN',
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          onPressed: () async {
            if (emailcon.text.isNotEmpty && password.text.isNotEmpty) {
              setState(() {
                isloading = true;
              });
              print(usn.text);

              signInStud(emailcon.text, password.text);
              allData().getCollection();
              DocumentSnapshot variable = await FirebaseFirestore.instance
                  .collection('Student')
                  .doc(usn.text)
                  .get();
              if (variable.exists) {
                if (emailcon.text == variable['email'] &&
                    password.text == variable['password']) {
                  setState(() {
                    isloading = false;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Home_student()));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: const Text('Wrong email or Password'),
                        actions: [
                          RaisedButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  print("Login Failed");
                  setState(() {
                    isloading = false;
                  });
                }
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert'),
                      content: const Text(
                          'Verification is Pending please contact your proctor..'),
                      actions: [
                        RaisedButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                print("Login Failed");
                setState(() {
                  isloading = false;
                });
              }
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alert'),
                    content: const Text('Please enter fields'),
                    actions: [
                      RaisedButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              print("Please fill form correctly");
            }
          },
        ),
      ),
    );
  }
}
