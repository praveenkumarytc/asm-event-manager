// ignore_for_file: file_names

import 'dart:io';

import 'package:event_app/utils/color_resources.dart';
import 'package:event_app/utils/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_select/image_selector.dart';

class ImageSourceSheet extends StatelessWidget {
  ImageSourceSheet({Key? key, required this.onImageSelected}) : super(key: key);

  final Function(File) onImageSelected;

  final picker = ImageSelect(
    cameraUiSettings: CameraUiSettings(
      appbarColor: ColorResources.PRIMARY_MATERIAL,
      textStyle: subHeadingBoldWhite,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
  );

  Future<void> selectedImage(BuildContext context, File? image) async {
    Navigator.pop(context);
    if (image != null) {
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: "Crop Image",
            toolbarColor: Theme.of(context).primaryColor,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: false,
            initAspectRatio: CropAspectRatioPreset.original,
          )
        ],
      );

      onImageSelected(File(croppedImage!.path));
    } else {
      debugPrint('Image Not found');
    }
  }

  // static Future<File> compress({
  //   required File image,
  //   int quality = 100,
  //   int percentage = 30,
  // }) async {
  //   var path = await FlutterNativeImage.compressImage(image.absolute.path, quality: quality, percentage: percentage);
  //   return path;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: ListTile(
            leading: const Text("Gallery", style: TextStyle(fontSize: 16, color: Colors.black)),
            onTap: () async {
              final pickedFile = await picker.pickImage(
                context: context,
                source: ImageFrom.gallery,
              );
              if (pickedFile == null) return;
              print('selected pic from gallery ${pickedFile.path}');
              selectedImage(context, File(pickedFile.path));
              // Navigator.pop(context);
              // onImageSelected(pickedFile);
            },
          ),
        ),

        // Capture image from camera
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: ListTile(
            leading: const Text("Camera", style: TextStyle(fontSize: 16, color: Colors.black)),
            onTap: () async {
              // Capture image from camera
              try {
                final pickedFile = await picker.pickImage(
                  context: context,
                  source: ImageFrom.camera,
                );
                if (pickedFile == null) return;
                selectedImage(context, File(pickedFile.path));
                // Navigator.pop(context);
              } on PlatformException catch (e) {
                print(e);
              }
            },
          ),
        ),

        // const SizedBox(height: 30),
      ],
    );
  }
}
