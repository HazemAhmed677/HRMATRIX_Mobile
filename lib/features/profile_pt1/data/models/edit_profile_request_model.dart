import 'dart:io';

import 'package:dio/dio.dart';

class EditProfileRequestModel {
  String? name;
  String? address;
  File? imageFile;

  EditProfileRequestModel({this.name, this.address, this.imageFile});

  Future<Map<String, dynamic>> toJson() async => {
    if (name != null) 'name': name,
    if (address != null) 'address': address,
    if (imageFile != null)
      'imageFile': await MultipartFile.fromFile(
        imageFile!.path,
        filename: imageFile!.path.split('/').last,
      ),
  };
}
