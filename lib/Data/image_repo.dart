import 'package:image_picker/image_picker.dart';

class ImagePickerRepo {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> UseCamera() async {
    try {
      XFile? file = await _picker.pickImage(source: ImageSource.camera);
      return file;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<XFile?> UseGallery() async {
    try {
      XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      return file;
    } catch (e) {
      throw e.toString();
    }
  }
}
