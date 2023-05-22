import 'package:flutter/material.dart';
import 'package:daynote/pages/enter_pin_page.dart';
import 'package:daynote/pages/login_page.dart';
import 'package:daynote/pages/register_page.dart';
import 'package:daynote/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset(
              'assets/images/woman.png',
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Note, Planner and \nReminder',
                  style: TextStyle(
                      fontSize: 29, color: kText, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'You can check and set your sechedule in a more convenient way.',
                  style: TextStyle(
                    fontSize: 15,
                    color: kText,
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        child: Text('Sign Up'),
                        style: ElevatedButton.styleFrom(
                            primary: kBlue,
                            fixedSize: Size(160, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: kText),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: kCreame,
                            fixedSize: Size(160, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
