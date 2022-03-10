import 'dart:io';

class Picture {
  final String id;
  final File? image;
  final double lat;
  final double long;
  Picture({
    required this.id,
    required this.image,
    required this.lat,
    required this.long,
  });
}
