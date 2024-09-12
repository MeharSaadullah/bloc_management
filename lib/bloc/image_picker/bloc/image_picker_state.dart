part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
  final XFile? file; // XFile comes from imaage picker package
  const ImagePickerState({this.file});

  ImagePickerState copyWith({XFile? file}) {
    return ImagePickerState(file: file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
