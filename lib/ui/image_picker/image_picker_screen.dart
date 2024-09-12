import 'dart:io';

import 'package:bloc_management/bloc/image_picker/bloc/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker BLoc"),
        ),
        body:
            //blocbuilder is used to moniter the changes in state
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
          if (state.file == null) {
            return InkWell(
              onTap: () {
                _showImageSourceDialog(context);
              },
              child: const CircleAvatar(
                child: Icon(Icons.camera),
              ),
            );
          } else {
            return Image.file(File(state.file!.path.toString()));
          }
        }));
  }

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  context
                      .read<ImagePickerBloc>()
                      .add(CameraCapture()); // Add CameraCapture event
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  context.read<ImagePickerBloc>().add(
                      GalleryImagePicker()); // Add GalleryImagePicker event
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
