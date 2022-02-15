import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intership/screens_student/Signin_student_screen.dart';
import 'package:intership/screens_teacher/signin_teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineStorage {
  static var str;
  late SharedPreferences pref;

  saveUserInfo(String photo, String name, String email, String uid) async {
    pref = await SharedPreferences.getInstance();
    await pref.setString("photo", photo);
    await pref.setString("name", name);
    await pref.setString("email", email);
    await pref.setString("uid", uid);
  }

  getUserInfo() async {
    // pref = await SharedPreferences.getInstance();
    // String? name = pref.getString("name");
    // String? email = pref.getString("email");
    // String? uid = pref.getString("uid");
    String name="", email="", uid="";
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
        name = list[i]['name'];
        email = list[i]['email'];
        uid = list[i]['uid'];
        print("inside if");
      }
      else if(list[i]['email'] == emailcon.text){
        str = list[i]['uid'];
        print(list[i]);
        name = list[i]['name'];
        email = list[i]['email'];
        uid = list[i]['uid'];
        print("inside if");
      }
    }
    return {'name': name, 'email': email, 'uid': uid};
  }
}
