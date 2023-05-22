import 'package:flutter/material.dart';
import 'package:daynote/models/user.dart';
import 'package:daynote/theme.dart';

class CardNote extends StatelessWidget {
  final Note note;
  CardNote(this.note);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${note.title}',
              style: myText.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            Text(
              '${note.tanggal}',
              style: myText.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
