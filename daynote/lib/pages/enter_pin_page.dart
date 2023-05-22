import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:daynote/models/user.dart';
import 'package:daynote/pages/create_pin_page.dart';
import 'package:daynote/pages/home_page.dart';
import 'package:daynote/theme.dart';

class EnterPin extends StatefulWidget {
  const EnterPin({Key? key}) : super(key: key);

  @override
  _EnterPinState createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  @override
  Widget build(BuildContext context) {
    String? _mypin;
    var pin;
    User _user = Provider.of<User>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');
    final TextEditingController _pin = TextEditingController();
    return StreamBuilder<QuerySnapshot>(
        stream: userProfile.where('id', isEqualTo: _user.uid).snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var myList = snapshot.data!.docs;
            for (var i = 0; i < myList.length; i++) {
              _mypin = myList[i]['pin'];
              print(_mypin);
            }
          }
          return (_mypin == null)
              ? CreatePin(_user)
              : Scaffold(
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your pin',
                            style: myText.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Column(
                            children: [
                              PinCodeFields(
                                keyboardType: TextInputType.number,
                                textStyle: myText.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                length: 6,
                                obscureText: true,
                                controller: _pin,
                                animationDuration:
                                    const Duration(milliseconds: 200),
                                animationCurve: Curves.easeInOut,
                                switchInAnimationCurve: Curves.easeIn,
                                switchOutAnimationCurve: Curves.easeOut,
                                animation: Animations.SlideInDown,
                                enabled: true,
                                onComplete: (output) {
                                  pin = output;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (pin == _mypin) {
                                    print(_mypin);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                },
                                child: Text(
                                  'Get Started',
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: kBlue,
                                    fixedSize: Size(180, 45),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }
}
