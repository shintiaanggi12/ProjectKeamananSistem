import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:daynote/theme.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  var date;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _detail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference activity = firestore.collection('activity');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgorund,
        elevation: 0,
        title: Text(
          'Add Activity',
          style: myBoldText,
        ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  'Title',
                  style: myBoldText.copyWith(fontSize: 18),
                ),
                TextFormField(
                  controller: _title,
                  style: myText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintStyle: myText,
                    hintText: 'write your task headline',
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                            color: kText, style: BorderStyle.solid, width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                            color: kText, style: BorderStyle.solid, width: 2)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Task Detail',
                  style: myBoldText.copyWith(fontSize: 18),
                ),
                TextFormField(
                  controller: _detail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title tidak boleh kosong';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    hintStyle: myText,
                    hintText: 'write your task detail',
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                            color: kText, style: BorderStyle.solid, width: 2)),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                            color: kText, style: BorderStyle.solid, width: 2)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Selected Day',
                  style: myBoldText.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: Column(
                    children: [
                      CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2018, 12, 29),
                          lastDate: DateTime(2021, 12, 29),
                          onDateChanged: (value) {
                            date = DateFormat.yMMMd().format(value);
                            print(date);
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Selected Time',
                  style: myBoldText.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                TimePickerDialog(
                  initialTime: TimeOfDay(hour: 23, minute: 00),
                  initialEntryMode: TimePickerEntryMode.input,
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    //! ERORRRRRRRRRRRRRRRRRRRRRRRRR
                    if (_formKey.currentState!.validate()) {
                      activity.add({
                        'id': _user.uid,
                        'title': _title.text,
                        'detail': _detail.text,
                        'date': date,
                      });
                    }
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
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
