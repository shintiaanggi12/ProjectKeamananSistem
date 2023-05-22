import 'package:flutter/material.dart';
import 'package:daynote/models/user.dart';
import 'package:daynote/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _listData = User.getUser();
  var _data;
  late int key = 100;
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.account_circle_outlined,
                      color: kBlue,
                    )),
                Text(
                  'Profil',
                  style: myText.copyWith(
                      fontWeight: FontWeight.w700, color: kBlue),
                )
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset(
                    'assets/images/${_listData[key].gambar}',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Profile',
                      style: myBoldText.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.5,
                  left: 20,
                  child: Text(
                    '${_listData[key].nama}',
                    style: myBoldText.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.account_circle,
                    ),
                    title: Text(
                      'Name',
                      style: myText,
                    ),
                    subtitle: Text(
                      '${_listData[key].nama}',
                      style: myBoldText.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.mail,
                    ),
                    title: Text(
                      'Email',
                      style: myText,
                    ),
                    subtitle: Text(
                      '${_listData[key].email}',
                      style: myBoldText.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                    ),
                    title: Text(
                      'No. Telepon',
                      style: myText,
                    ),
                    subtitle: Text(
                      '${_listData[key].nama}',
                      style: myBoldText.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/splash');
              },
              child: Text(
                'Logout',
                style: myText.copyWith(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: kRed,
                  fixedSize: Size(180, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
