import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intership/screens_teacher/signin_teacher_screen.dart';

class MainHome_teacher extends StatefulWidget {
  @override
  const MainHome_teacher({Key? key}) : super(key: key);

  @override
  _NotState createState() => _NotState();
}

class _NotState extends State<MainHome_teacher> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  var vd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("all data"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Teachers')
            .doc(TidController.text)
            .collection("Student")
            .where('isverified', isEqualTo: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Card(
                  child: Container(
                height: 150,
                width: 350,
                color: Colors.blue[200],
                child: Column(children: [
                  FlatButton(
                      onPressed: null,
                      child: Text(
                        document['name'],
                        style: TextStyle(color: Colors.black),
                      )),
                  FlatButton(
                      onPressed: null,
                      child: Text(
                        document['usn'],
                        style: TextStyle(color: Colors.black),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green[800])),
                          onPressed: () async {
                            await _firestore
                                .collection('Teachers')
                                .doc(TidController.text)
                                .collection('Student')
                                .doc(document['usn'])
                                .update({"isverified": true});

                            await _firestore
                                .collection("Student")
                                .doc(document['usn'])
                                .set({
                              "name": document['name'],
                              "email": document['email'],
                              "password": document['password'],
                              "usn": document['usn'],
                              "sem": document['sem'],
                              "isverified": true,
                              "branch": document['branch'],
                              "proctor": document['proctor'],
                              "uid": _auth.currentUser!.uid,
                            });
                            await _firestore
                                .collection('Teachers')
                                .doc(TidController.text)
                                .collection('Student')
                                .doc(document['usn'])
                                .delete();
                          },
                          child: Text(
                            "Accept",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red[900])),
                          onPressed: () async {
                            await _firestore
                                .collection('Teachers')
                                .doc(TidController.text)
                                .collection('Student')
                                .doc(document['usn'])
                                .delete();

                            //signInStud(document['email'], document['password']);
                          },
                          child: Text(
                            "Decline",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ])
                ]),
              ));
            }).toList(),
          );
        },
      ),
    );
  }
}
