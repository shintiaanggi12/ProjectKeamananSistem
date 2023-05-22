import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:daynote/pages/home/note_page.dart';
import 'package:daynote/theme.dart';
import 'package:daynote/partials/card_note.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  var _date = DateFormat.yMMMd().format(DateTime.now());
  var myName;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _deksripsi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference note = firestore.collection('note');
    CollectionReference userProfile = firestore.collection('user_profile');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgorund,
          elevation: 0,
          title: Text(
            'Add Note',
            style: myBoldText,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.post_add_rounded,
                color: kRed,
                size: 30,
              ),
            )
          ],
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StreamBuilder<QuerySnapshot>(
                            stream: userProfile
                                .where('id', isEqualTo: _user.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var myProfile = snapshot.data!.docs;
                                for (var i = 0; i < myProfile.length; i++) {
                                  myName = myProfile[i]['nama'];
                                }
                              }
                              return Text(
                                'Hi, ${myName}',
                                style: myText.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                ),
                              );
                            }),
                        Text(
                          _date,
                          style: myText.copyWith(),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _title,
                  style: myBoldText.copyWith(fontSize: 15),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: myBoldText.copyWith(fontSize: 15),
                    hintText: "Title",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TextField(
                    controller: _deksripsi,
                    keyboardType: TextInputType.text,
                    maxLines: null,
                    maxLength: 1000,
                    expands: true,
                    decoration:
                        InputDecoration(fillColor: Colors.white, filled: true),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    note.add({
                      'id': _user.uid,
                      'title': _title.text,
                      'dekskripsi': _deksripsi.text,
                      'tanggal': _date,
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => NotePage()));
                  },
                  child: Text(
                    'ADD',
                    style: myText.copyWith(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: kRed,
                      fixedSize: Size(180, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
