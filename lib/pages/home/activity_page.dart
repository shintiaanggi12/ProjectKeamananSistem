import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daynote/theme.dart';
import 'package:daynote/partials/card_activity.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  var myname;
  var myimage;
  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference activity = firestore.collection('activity');
    CollectionReference userProfile = firestore.collection('user_profile');
    return Scaffold(
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
                      StreamBuilder<QuerySnapshot>(
                          stream: userProfile
                              .where('id', isEqualTo: _user.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var myProfile = snapshot.data!.docs;
                              for (var i = 0; i < myProfile.length; i++) {
                                myname = myProfile[i]['nama'];
                                myimage = myProfile[i]['img'];
                              }
                            }
                            return Text('Welcome ${myname}',
                                style: TextStyle(color: Colors.grey[600]));
                          }),
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: userProfile
                          .where('id', isEqualTo: _user.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var myProfile = snapshot.data!.docs;
                          for (var i = 0; i < myProfile.length; i++) {
                            myname = myProfile[i]['nama'];
                            myimage = myProfile[i]['img'];
                          }
                        }
                        return Container(
                          child: (myimage == null)
                              ? CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(myimage),
                                ),
                        );
                      })
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
                  //! Maping data firebase
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: activity
                          .where('id', isEqualTo: _user.uid)
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          var myAct = snapshot.data!.docs;
                          return Column(
                              children: myAct
                                  .map((data) => CardActivity(
                                          Activity(
                                              id: data['id'],
                                              title: data['title'],
                                              detail: data['detail'],
                                              date: data['date']),
                                          finishCart: () {
                                        activity.doc(data.id).delete();
                                      }))
                                  .toList());
                        } else {
                          return Text('Belum ada data');
                        }
                      },
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
