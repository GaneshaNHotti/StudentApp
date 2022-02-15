import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intership/Helper/Constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {
  //  DatabaseHelper() {
  //   _db = FirebaseFirestore.instance;
  // }
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage =
      FirebaseStorage.instanceFor(bucket: Constants.firebaseReferenceURI);

  getUserByUsername({required String username}) async {
    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list;
    CollectionReference collectionRef =FirebaseFirestore.instance.collection("Users").doc(username).get() as CollectionReference<Object?>;
    QuerySnapshot collectionSnapshot  =
        await collectionRef.get(); 
        templist = collectionSnapshot.docs;


        list = templist.map((DocumentSnapshot docSnapshot) {
      return docSnapshot.data() as Map<dynamic, dynamic>; // <--- Typecast this.
    }).toList();

    print("====getuserbyusername=====");
    print(list);
    return await _db.collection('Users').doc(username).get();
  }

  getUserByEmail({required String email}) async {
    return await _db.collection('Users').where('email', isEqualTo: email).get();
  }

  getChats({required String userId}) {
    print("--------database-------");
    print(userId);
    return _db
        .collection('chats')
        .where('members', arrayContains: userId)
        .orderBy('lastActive', descending: true)
        .snapshots();
  }

  getChat({
    required String userId,
    required String myId,
  }) {
    String chatId = generateChatId(username1: userId, username2: myId);
    return _db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots();
  }

  generateChatId({required String username1, required String username2}) {
    return username1.toString().compareTo(username2.toString()) < 0
        ? username1.toString() + '-' + username2.toString()
        : username2.toString() + '-' + username1.toString();
  }

  Future<bool> checkChatExistsOrNot(
      {required String username1, required String username2}) async {
    String chatId = generateChatId(username1: username1, username2: username2);
    DocumentSnapshot doc = await _db.collection('chats').doc(chatId).get();
    return doc.exists;
  }

  sendMessage({
    required String to,
    required String from,
    required bool isText,
    required String msg,
    String? path,
  }) async {
    bool existsOrNot =
        await checkChatExistsOrNot(username1: to, username2: from);
    FirebaseFirestore tempDb = FirebaseFirestore.instance;
    String chatId = generateChatId(username1: from, username2: to);
    Timestamp now = Timestamp.now();
    if (!existsOrNot) {
      List<String> members = [to, from];
      isText
          ? await tempDb
              .collection('chats')
              .doc(chatId)
              .collection('messages')
              .add(
              {'from': from, 'message': msg, 'time': now, 'isText': true},
            )
          : await tempDb
              .collection('chats')
              .doc(chatId)
              .collection('messages')
              .add(
              {'from': from, 'photo': path, 'time': now, 'isText': false},
            );
      await tempDb
          .collection('chats')
          .doc(chatId)
          .set({'lastActive': now, 'members': members});
    } else {
      isText
          ? await tempDb
              .collection('chats')
              .doc(chatId)
              .collection('messages')
              .add(
              {'from': from, 'message': msg, 'time': now, 'isText': true},
            )
          : await tempDb
              .collection('chats')
              .doc(chatId)
              .collection('messages')
              .add(
              {'from': from, 'photo': path, 'time': now, 'isText': false},
            );
      await tempDb.collection('chats').doc(chatId).update({'lastActive': now});
    }
  }

//   uploadImage({
//     required File image,
//     required String to,
//     required String from,
//   }) {
//     String chatId = generateChatId(username1: to, username2: from);
//     String filePath = 'chatImages/$chatId/${DateTime.now()}.png';
//     _uploadTask = _firebaseStorage.ref().child(filePath).putFile(image);
//     return _uploadTask;
//   }

//   getURLforImage(String imagePath) async {
//     FirebaseStorage storage = FirebaseStorage.instance;
//     StorageReference sRef =
//         await storage.getReferenceFromUrl(Constants.firebaseReferenceURI);
//     StorageReference pathReference = sRef.child(imagePath);
//     return await pathReference.getDownloadURL();
//   }
}
