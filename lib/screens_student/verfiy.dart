// TODO Implement this library.
import 'package:flutter/material.dart';
class verify extends StatefulWidget {
  const verify({ Key? key }) : super(key: key);

  @override
  _verifyState createState() => _verifyState();
}

class _verifyState extends State<verify> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            ListTile(
              //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
              title: Row(
                children: <Widget>[
                  Expanded(child: RaisedButton(onPressed: () {},child: Text("Accept"),color: Colors.black,textColor: Colors.white,)),
                  Expanded(child: RaisedButton(onPressed: () {},child: Text("Decline"),color: Colors.black,textColor: Colors.white,)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}