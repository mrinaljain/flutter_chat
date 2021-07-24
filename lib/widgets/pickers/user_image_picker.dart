import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePick;

  UserImagePicker({this.imagePick});
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImage() async {
    final image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 100);
    setState(() {
      if (image != null) {
        _pickedImage = File(image.path);
      } else {
        print('No image selected.');
      }
    });
    widget.imagePick(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        TextButton.icon(
            onPressed: () => _pickImage(),
            icon: Icon(Icons.image),
            label: Text('Add Image'))
      ],
    );
  }
}
