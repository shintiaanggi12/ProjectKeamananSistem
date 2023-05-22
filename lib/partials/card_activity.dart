import 'package:flutter/material.dart';
import 'package:daynote/theme.dart';

class Activity {
  String id, title, detail, date;
  Activity(
      {required this.id,
      required this.title,
      required this.detail,
      required this.date});
}

class CardActivity extends StatelessWidget {
  Activity _activity;
  final Function finishCart;
  CardActivity(this._activity, {required this.finishCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _activity.title,
                        style: myText.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        _activity.detail,
                        style: myText.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      side: BorderSide(
                        width: 1,
                        color: kText,
                      ),
                      fixedSize: Size(100, 10),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.mode_edit_outline_sharp,
                        size: 13,
                        color: kText,
                      ),
                      Text(
                        'Edit',
                        style: myText.copyWith(fontSize: 13, color: kText),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      side: BorderSide(
                        width: 1,
                        color: Colors.green,
                      ),
                      fixedSize: Size(100, 10),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    finishCart();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.task_alt,
                        size: 13,
                        color: Colors.green,
                      ),
                      Text(
                        'Finish',
                        style:
                            myText.copyWith(fontSize: 13, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
