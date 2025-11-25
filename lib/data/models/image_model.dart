import 'dart:typed_data';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

class ImageModel {
  String id;
  final String url;
  final String? folder;
  final int? sizeBytes;
  String mediaCategory;
  final String filename;
  final String? fullpath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? contentType;

  // Not Mapped
  final DropzoneFileInterface? file;
  RxBool isSelected = false.obs;
  final Uint8List? localImageToDisplay;

  ImageModel({
    this.id = "",
    required this.url,
    this.folder,
    this.sizeBytes,
    this.mediaCategory = "",
    required this.filename,
    this.fullpath,
    this.createdAt,
    this.updatedAt,
    this.contentType,
    this.file,
    this.localImageToDisplay,
  });

  /// Static
  static ImageModel empty() => ImageModel(url: "", folder: "", filename: "");

  factory ImageModel.fromString(String imageUrl) {
    return ImageModel(
      url: imageUrl,
      filename: imageUrl.split('/').last, // extract file name
      folder: 'gallery',
    );
  }

  // String get createdAtFormatted => ;
}
