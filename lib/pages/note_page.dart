import 'package:flutter/material.dart';
import 'package:daynote/models/user.dart';
import 'package:daynote/pages/detail_note.dart';
import 'package:daynote/theme.dart';
import 'package:daynote/widgets/card_note.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  var _listNote = Note.getNote();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(1, -3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/activity');
                    },
                    icon: Icon(
                      Icons.card_travel_rounded,
                      color: kText,
                    )),
                Text(
                  'Activity',
                  style: myText.copyWith(
                      fontWeight: FontWeight.w700, color: kText),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.note_outlined,
                      color: kBlue,
                    )),
                Text(
                  'Note',
                  style: myText.copyWith(
                      fontWeight: FontWeight.w600, color: kBlue),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/profile');
                    },
                    icon: Icon(
                      Icons.account_circle_outlined,
                      color: kText,
                    )),
                Text(
                  'Profil',
                  style: myText.copyWith(
                      fontWeight: FontWeight.w700, color: kText),
                )
              ],
            ),
          ],
        ),
      ),
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
      body: ListView(
          children: _listNote
              .map((data) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailNote(Note(
                                  id: data.id,
                                  title: data.title,
                                  tanggal: data.tanggal,
                                  fill: data.fill))));
                    },
                    child: CardNote(Note(
                        id: data.id,
                        title: data.title,
                        tanggal: data.tanggal,
                        fill: data.fill)),
                  ))
              .toList()),
    );
  }
}
