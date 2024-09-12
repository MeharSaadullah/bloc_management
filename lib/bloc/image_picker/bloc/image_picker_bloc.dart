import 'package:bloc/bloc.dart';
import 'package:bloc_management/Utils/image_picker_utiles.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtiles
      imagePickerUtiles; // here we do dependencie injection of utils class
  ImagePickerBloc(this.imagePickerUtiles) : super(const ImagePickerState()) {
    // on<ImagePickerEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(pickImagefromGallery);
  }
  void cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtiles.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void pickImagefromGallery(
      GalleryImagePicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtiles.pickImagefromGallery();
    emit(state.copyWith(file: file));
  }
}
