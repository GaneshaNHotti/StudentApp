import 'package:flutter/material.dart';
import 'package:intership/main.dart';
import 'package:intership/screens_student/Methods.dart';
import 'package:intership/screens_student/Signin_student_screen.dart';
import 'package:intership/screens_student/home_student_screen.dart';
import 'package:intership/screens_student/loading.dart';
import 'package:intership/screens_student/mainhome_student_screen.dart';
import 'package:intership/screens_teacher/home_teacher_screen.dart';

// ignore: camel_case_types
class Signup_student extends StatefulWidget {
  Signup_student({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup_student> {
  String dropdownValue = '1';
  String dropdownValue1 = 'ISE';
  String dropdownValue2 = 'PROC1';
  var items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  List<String> items1 = [
    'ISE',
    'EEE',
    'ECE',
    'CSE',
    'CHEMICAL',
    'MECHANICAL',
    'AGRICULTURAL',
    'INDUSTRIAL',
    'ARCHITECTURAL',
    'AEROSPACE',
    'BIOMEDICAL'
  ];
  List<String> items2 = [
    'PROC1',
    'PROC2',
    'PROC3',
    'PROC4',
    'PROC5',
    'PROC6',
    'PROC7',
    'PROC8',
    'PROC9',
    'PROC10'
  ];

  final TextEditingController usnController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isloading = false;

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
                              controller: usnController,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.badge),
                                  border: OutlineInputBorder(),
                                  labelText: 'USN',
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
                              obscureText: false,
                              controller: nameController,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  border: OutlineInputBorder(),
                                  labelText: 'NAME',
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
                            child: FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.list),
                                      errorStyle: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 8.0),
                                      labelText: 'SEM',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0))),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      isDense: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                          state.didChange(newValue);
                                        });
                                      },
                                      items: items.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
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
                            child: FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.book),
                                      labelText: 'BRANCH',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0))),
                                  child: DropdownButtonHideUnderline(
                                    child: new DropdownButton(
                                      value: dropdownValue1,
                                      isDense: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue1 = newValue!;
                                          state.didChange(newValue);
                                        });
                                      },
                                      items: items1.map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
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
                            child: FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      icon:
                                          Icon(Icons.person_add_alt_1_outlined),
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 8.0),
                                      labelText: 'PROCTOR',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0))),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: dropdownValue2,
                                      isDense: true,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue2 = newValue!;
                                          print(dropdownValue2);
                                          state.didChange(newValue);
                                        });
                                      },
                                      items: items2.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
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
                        Card(
                          child: Container(
                            height: 78,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                              controller: emailController,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.mail),
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
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
                              controller: passwordController,
                              cursorColor: Colors.brown,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.password),
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
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
                        customButton(size),
                        Container(
                            child: Row(
                          children: <Widget>[
                            Text('Already have account?',
                                style: TextStyle(color: Colors.white)),
                            FlatButton(
                              textColor: Colors.black,
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
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
            'SIGN UP',
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          onPressed: () {
            if (nameController.text.isNotEmpty &&
                emailController.text.isNotEmpty &&
                passwordController.text.isNotEmpty &&
                usnController.text.isNotEmpty) {
              setState(() {
                isloading = true;
              });
              signUp(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                      dropdownValue,
                      dropdownValue1,
                      dropdownValue2,
                      usnController.text)
                  .then((user) {
                if (user != null) {
                  setState(() {
                    isloading = false;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                  print("Account Created Sucessfull");
                } else {
                  print("Login Failed");
                  setState(() {
                    isloading = false;
                  });
                }
              });
            } else {
              print("Please enter Fields");
            }
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Home_student()));
          },
        ),
      ),
    );
  }
}
