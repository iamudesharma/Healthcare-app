import 'dart:io';
import 'dart:typed_data';

Future<ByteData> getImageFromUrl(String url) async {
  File? file = File(url);

  final _image = await file.readAsBytes();

  return _image.buffer.asByteData();
}
