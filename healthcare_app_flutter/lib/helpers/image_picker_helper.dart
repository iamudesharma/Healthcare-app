import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<File?> getImage({required ImageSource imageSource}) async {
    var image = await ImagePicker().pickImage(source: imageSource);

    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
