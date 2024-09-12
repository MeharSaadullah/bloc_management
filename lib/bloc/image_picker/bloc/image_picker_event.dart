part of 'image_picker_bloc.dart';

sealed class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

// CREATE EVENTS
class CameraCapture extends ImagePickerEvent {}

class GalleryImagePicker extends ImagePickerEvent {}
