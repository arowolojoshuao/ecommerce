import 'dart:io';

import 'package:image_picker/image_picker.dart';

final _picker = ImagePicker();

class Upload {
  static Future<dynamic> getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }
}
