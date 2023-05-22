import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daynote/pages/home/activity_page.dart';
import 'package:daynote/pages/home/note_page.dart';
import 'package:daynote/pages/home/profile_page.dart';
import 'package:daynote/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [ActivityPage(), NotePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');
    CollectionReference activity = firestore.collection('activity');
    CollectionReference note = firestore.collection('note');
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey[600],
          selectedItemColor: kBlue,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.card_travel_rounded,
                ),
                label: 'Activity',
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_outlined,
                ),
                label: 'Note',
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: 'Profile',
                backgroundColor: Colors.red),
          ]),
    );
  }
}
