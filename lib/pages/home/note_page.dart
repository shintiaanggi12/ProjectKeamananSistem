import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:daynote/pages/note/detail_note.dart';
import 'package:daynote/theme.dart';
import 'package:daynote/partials/card_note.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  var _date = DateFormat.yMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference note = firestore.collection('note');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgorund,
          elevation: 0,
          title: Text(
            'Note',
            style: myBoldText,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add_note');
              },
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
        body: StreamBuilder<QuerySnapshot>(
          stream: note.where('id', isEqualTo: _user.uid).snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var myNote = snapshot.data!.docs;
              return ListView(
                children: myNote
                    .map((data) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailNote(Note(
                                        id: data['id'],
                                        title: data['title'],
                                        tanggal: data['tanggal'],
                                        dekskripsi: data['dekskripsi']))));
                          },
                          child: CardNote(
                              Note(
                                  id: data['id'],
                                  title: data['title'],
                                  tanggal: data['tanggal'],
                                  dekskripsi: data['dekskripsi']), delCart: () {
                            note.doc(data.id).delete();
                          }),
                        ))
                    .toList(),
              );
            } else {
              return Text('Belum ada data');
            }
          },
        ));
  }
}
