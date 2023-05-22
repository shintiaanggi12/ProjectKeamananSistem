import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:daynote/models/user.dart';
import 'package:daynote/theme.dart';
import 'package:daynote/widgets/card_activity.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  var _listData = User.getUser();
  var _data;
  late int key = 1;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    _data = args;
    for (var i = 0; i < _listData.length; i++) {
      if (_data == _listData[i].pin) {
        key = i;
        break;
      }
    }
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.card_travel_rounded,
                      color: kBlue,
                    )),
                Text(
                  'Activity',
                  style: myText.copyWith(
                      fontWeight: FontWeight.w700, color: kBlue),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/note');
                    },
                    icon: Icon(
                      Icons.note_outlined,
                      color: kText,
                    )),
                Text(
                  'Note',
                  style: myText.copyWith(
                      fontWeight: FontWeight.w600, color: kText),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/profile', arguments: _listData[key].pin);
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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: myText.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                      Text('Welcome ${_listData[key].nama}',
                          style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/${_listData[key].gambar}'),
                  ),
                ],
              ),
            ),
            Card(
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2019, 1, 15),
                lastDate: DateTime(2030, 11, 20),
                onDateChanged: (date) => print(date),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'My Activity',
                          style: myText.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(
                                width: 1,
                                color: kRed,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/add_activity');
                          },
                          child: Text(
                            '+ Add',
                            style: myText.copyWith(fontSize: 11, color: kRed),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        for (var i = 0; i < 4; i++)
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: CardActivity(),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
