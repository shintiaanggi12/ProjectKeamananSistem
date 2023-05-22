import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daynote/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var _nama = 'tes';
  var _nama2 = 'tes2';
  var _no_hp = 'tes3';
  var _image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user_profile = firestore.collection('user_profile');
    return FutureBuilder<QuerySnapshot>(
        future: user_profile.where('id', isEqualTo: _user.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var myProfile = snapshot.data!.docs;
            for (var i = 0; i < myProfile.length; i++) {
              _nama = myProfile[i]['nama'];
              _nama2 = myProfile[i]['nama2'];
              _no_hp = myProfile[i]['no_hp'];
              _image = myProfile[i]['img'];
            }
          }
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: (_image != null)
                            ? BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(_image),
                                    fit: BoxFit.cover))
                            : BoxDecoration(color: Colors.transparent),
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
                          _nama + ' ' + _nama2,
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
                            _nama,
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
                            _user.email.toString(),
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
                            _no_hp,
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
        });
  }
}
