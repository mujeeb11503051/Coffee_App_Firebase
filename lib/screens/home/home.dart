import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_coffee_app/models/brew.dart';
import 'package:firebase_coffee_app/services/auth.dart';
import 'package:firebase_coffee_app/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text("Bottom Sheet"),
            );
          });
    }

    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: Text(
                  'logout',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  await _auth.signOut();
                }),
            TextButton.icon(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                label: Text(
                  "settings",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  _showSettingsPanel();
                }),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
