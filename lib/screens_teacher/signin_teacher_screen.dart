import 'package:flutter/material.dart';
import 'package:intership/Helper/alldata.dart';
import 'package:intership/screens_teacher/home_teacher_screen.dart';
import 'package:intership/screens_student/Methods.dart';
import 'package:intership/screens_student/loading.dart';

// ignore: camel_case_types
class Signin_teacher extends StatefulWidget {
  const Signin_teacher({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

TextEditingController TeacheremailController = TextEditingController();
bool isloading = false;
final TextEditingController TidController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SigninState extends State<Signin_teacher> {
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
                              controller: TidController,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.badge),
                                  border: OutlineInputBorder(),
                                  labelText: 'TEACHER ID',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber[50],
                              borderRadius: BorderRadius.circular(20),
                            ),
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
                              controller: TeacheremailController,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.badge),
                                  border: OutlineInputBorder(),
                                  labelText: 'EMAIL',
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
                              obscureText: false,
                              controller: passwordController,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_outline,
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'PASSWORD',
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
                          height: 50,
                        ),
                        customButton(size),
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
          onPressed: () {
            if (TeacheremailController.text.isNotEmpty &&
                passwordController.text.isNotEmpty) {
              setState(() {
                isloading = true;
              });

              signInTeach(TeacheremailController.text, passwordController.text)
                  .then((user) {
                if (user != null) {
                  print("Login Sucessfull");
                   allData().getCollection();
                  setState(() {
                    isloading = false;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Home_teacher()));
                  
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
              });
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
