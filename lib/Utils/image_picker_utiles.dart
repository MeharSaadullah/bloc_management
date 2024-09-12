import 'package:image_picker/image_picker.dart';

class ImagePickerUtiles {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    //<XFile is return type >
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> pickImagefromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
