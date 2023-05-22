import 'package:flutter/material.dart';
import 'package:daynote/theme.dart';
import 'package:daynote/widgets/card_note.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
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
                        '29 Des 2021',
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
