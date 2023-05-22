import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:daynote/controllers/image_controller.dart';
import 'package:daynote/theme.dart';
import 'package:daynote/wrap.dart';

class CreatePin extends StatefulWidget {
  final User user;
  CreatePin(this.user);

  @override
  _CreatePinState createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _name2 = TextEditingController();
  final TextEditingController _nohp = TextEditingController();
  final TextEditingController _pin = TextEditingController();
  var myimages;
  var mypin;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference userProfile = firestore.collection('user_profile');

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: SizedBox(
                      height: 115,
                      width: 115,
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            child: (myimages == null)
                                ? CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/tes1.png'))
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(myimages)),
                          ),
                          Positioned(
                            right: -16,
                            bottom: 0,
                            child: SizedBox(
                              height: 46,
                              width: 46,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                    primary: Colors.white,
                                    backgroundColor: Color(0xFFF5F6F9),
                                  ),
                                  onPressed: () async {
                                    File file = await getImage();
                                    await ImgServices.uploadImage(file);
                                    myimages =
                                        await ImgServices.uploadImage(file);
                                    setState(() {
                                      setState(() {});
                                    });
                                  },
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.black,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    controller: _name,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama depan tidak boleh kosong';
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Nama depan",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(
                        Icons.account_circle_sharp,
                        color: kText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: _name2,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama belakang tidak boleh kosong';
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Nama belakang",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(
                        Icons.account_circle_sharp,
                        color: kText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: _nohp,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'No. Handphone tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "No. Handphone",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(
                        Icons.call,
                        color: kText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Create your pin',
                    style: myText.copyWith(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        PinCodeFields(
                          keyboardType: TextInputType.number,
                          textStyle: myText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          length: 6,
                          controller: _pin,
                          obscureText: true,
                          animationDuration: const Duration(milliseconds: 200),
                          animationCurve: Curves.easeInOut,
                          switchInAnimationCurve: Curves.easeIn,
                          switchOutAnimationCurve: Curves.easeOut,
                          animation: Animations.SlideInDown,
                          enabled: true,
                          onComplete: (output) {
                            mypin = output;
                            print(output);
                          },
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _pin != null) {
                              userProfile.add({
                                'id': widget.user.uid,
                                'nama': _name.text,
                                'nama2': _name2.text,
                                'no_hp': _nohp.text,
                                'pin': mypin,
                                'img': myimages,
                              });
                              print('gagal');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Wrapper()));
                            }
                            return null;
                          },
                          child: Text(
                            'Get Started',
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: kBlue,
                              fixedSize: Size(180, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<File> getImage() async {
    return await ImagePicker.pickImage(source: ImageSource.gallery);
  }
}
