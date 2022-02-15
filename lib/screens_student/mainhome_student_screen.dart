import 'package:flutter/material.dart';
import 'package:intership/main.dart';

import 'Methods.dart';

class MainHome_student extends StatefulWidget {
  const MainHome_student({Key? key}) : super(key: key);

  @override
  _MainHome_studentState createState() => _MainHome_studentState();
}

class _MainHome_studentState extends State<MainHome_student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 8,
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      body: Center(child: Text("not decided")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: primaryColor,
                      backgroundImage: NetworkImage(
                          "https://www.usbji.org/sites/default/files/person.jpg"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: FloatingActionButton(
                          backgroundColor: primaryColor,
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.edit,
                            ),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('USER NAME'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.message,
              ),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(
                Icons.logout,
              ),
              onTap: () {
                logOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
