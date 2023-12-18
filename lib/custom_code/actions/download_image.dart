// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_gallery_saver/image_gallery_saver.dart';

Future downloadImage(String? imageGiven) async {
  // download an image from the imagePath and save to the photo library of the device
  if (imageGiven != null) {
    try {
      // Download the image from the given path
      var http;
      var response = await http.get(Uri.parse(imageGiven));
      // Save the image to the photo library
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.bodyBytes),
          quality: 60,
          name: "downloaded_image");
      print("Image saved to gallery: $result");
    } catch (e) {
      print("Error saving image: $e");
    }
  }
}
