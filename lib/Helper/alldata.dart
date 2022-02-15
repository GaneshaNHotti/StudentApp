import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intership/screens_student/Signin_student_screen.dart';
import 'package:intership/screens_teacher/signin_teacher_screen.dart';

class allData {
  static var str;
  getCollection() async {
    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list;
    List<dynamic> newData;
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("Users");
    QuerySnapshot collectionSnapshot =
        await collectionRef.get(); // <--- This method is now get().

    templist = collectionSnapshot.docs; // <--- ERROR
    //  var str;

    list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data() as Map<dynamic, dynamic>; // <--- Typecast this.
    }).toList();
    print('Printing Data');
    print(list);
    for (var i = 0; i < list.length; i++) {
      print("insidefor");
      if (list[i]['email'] == TeacheremailController.text) {
        //  print(list[i]['uid']);
        str = list[i]['uid'];
        print(list[i]);

        print("inside if");
      } 
      else if (list[i]['email'] == emailcon.text) {
        str = list[i]['uid'];
        print(list[i]);
      }
      //print(str);
     
    }
     return str;
  }
}
