// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_camera_app_1/models/pictures_model.dart';
import 'package:flutter_camera_app_1/repo/get_location.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  File? _image;
  final imagePicker = ImagePicker();
  List<Picture> items = [];

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    final _location = await GetLocation().getUserLocation();

    setState(() {
      _image = File(image!.path);
      items;
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image!.path);
    final savedImage = await _image?.copy('${appDir.path}/$fileName');
    final _storedImg = savedImage;

    final double? _latitude = _location!.latitude;
    final double? _longitude = _location.longitude;
    addPhoto(_storedImg!, _latitude, _longitude);
  }

  void addPhoto(
    File pickedImage,
    double? latitude,
    double? longitude,
  ) {
    final newPhoto = Picture(
      id: DateTime.now().toString(),
      image: pickedImage,
      lat: latitude!,
      long: longitude!,
    );
    items.add(newPhoto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: items.isEmpty == true
              ? const Text('No Image Selected')
              : Center(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Image(
                        image: FileImage(items[index].image!),
                      ),
                    ),
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getImage,
        backgroundColor: Colors.blue,
        label: const Text('Take pictures'),
        icon: const Icon(Icons.camera_alt),
      ),
    );
  }
}
