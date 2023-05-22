import 'package:flutter/material.dart';
import 'package:daynote/theme.dart';

class Note {
  final String id, title, tanggal, dekskripsi;
  Note({
    required this.id,
    required this.title,
    required this.tanggal,
    required this.dekskripsi,
  });
}

class CardNote extends StatelessWidget {
  final Note note;
  final Function delCart;
  CardNote(this.note, {required this.delCart});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                delCart();
              },
            )
          ],
        ),
      ),
    );
  }
}
