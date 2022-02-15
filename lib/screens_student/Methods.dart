import 'package:intership/screens_student/Signin_student_screen.dart';
import 'package:intership/screens_student/Signup_student_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intership/screens_student/verfiy.dart';
import 'package:intership/screens_teacher/signin_teacher_screen.dart';

Future<User?> signUp(String name, String email, String password, String dd,
    String dd1, String dd2, String usn) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print("Account created Succesfull");

    userCrendetial.user!.updateDisplayName(name);

    // await _firestore.collection('Students').doc(usn).set({
    //   "name": name,
    //   "email": email,
    //   "usn": usn,
    //   "sem": dd,
    //   "branch": dd1,
    //   "proctor": dd2,
    //   "password": password,
    //   "status": "Unavalible",
    //   "uid": _auth.currentUser!.uid,
    // });

    await _firestore
        .collection('Teachers')
        .doc(dd2)
        .collection("Student")
        .doc(usn)
        .set({
      "name": name,
      "email": email,
      "usn": usn,
      "sem": dd,
      "isverified": false,
      "branch": dd1,
      "proctor": dd2,
      "password": password,
      //"status": "Unavalible",
      "uid": _auth.currentUser!.uid,
    });
    await _firestore
        .collection('Users')
        .doc(_auth.currentUser!.uid)
        .set({
      "name": name,
      "email": email,
      "usn": usn,
      "status": "Offline",
      "uid": _auth.currentUser!.uid,
    });

    

    return userCrendetial.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Signin_student()));
    });
  } catch (e) {
    print("error");
  }
}

Future<User?> signInTeach(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    print("Login Sucessfull");
    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => userCredential.user!.updateDisplayName(value['name']));

    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> signInStud(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    print("Login Sucessfull");
    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => userCredential.user!.updateDisplayName(value['name']));

    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}