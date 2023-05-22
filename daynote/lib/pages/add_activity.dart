import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:daynote/theme.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({Key? key}) : super(key: key);

  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            children: [
              Text(
                'Title',
                style: myBoldText.copyWith(fontSize: 18),
              ),
              TextFormField(
                style: myText,
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
                        onDateChanged: (value) => print(value)),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Set Date'),
                            style: ElevatedButton.styleFrom(
                                primary: kBlue,
                                fixedSize: Size(150, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Cancel ',
                              style: TextStyle(color: kText),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: kCreame,
                                fixedSize: Size(150, 45),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ],
                      ),
                    ),
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
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
