import 'package:flutter/material.dart';
import 'package:daynote/models/user.dart';
import 'package:daynote/theme.dart';

class DetailNote extends StatefulWidget {
  final Note note;
  DetailNote(this.note);

  @override
  _DetailNoteState createState() => _DetailNoteState();
}

class _DetailNoteState extends State<DetailNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgorund,
          elevation: 0,
          title: Text(
            'Detail Note',
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
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi, Shahila',
                        style: myText.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '${widget.note.tanggal}',
                        style: myText.copyWith(),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: myBoldText.copyWith(fontSize: 15),
                decoration: InputDecoration(
                  enabled: false,
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: myBoldText.copyWith(fontSize: 15),
                  hintText: "${widget.note.title}",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(
                  '${widget.note.fill}',
                  style: myText.copyWith(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
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
        ));
  }
}
