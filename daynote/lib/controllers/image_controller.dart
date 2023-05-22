import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImgServices {
  static Future<String> uploadImage(File image) async {
    String fileImg = basename(image.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileImg);
    UploadTask task = ref.putFile(image);

    TaskSnapshot snapshot =
        await task.whenComplete(() async => await ref.getDownloadURL());
    return await snapshot.ref.getDownloadURL();
  }
}
