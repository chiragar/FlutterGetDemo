import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlivedemo/src/core/assets.dart';
import 'package:flutterlivedemo/src/data/model/user_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailScreen extends StatefulWidget {
  final datas;

  const DetailScreen({super.key, required this.datas});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  File? galleryFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      radius: 50.0, // Adjust radius as needed
                      backgroundColor: Colors.grey[200], // Placeholder color
                      child: galleryFile == null
                          ? Image.asset(
                              CustomAssets.gallery,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover, // Adjust fit as needed
                            )
                          : ClipOval(
                              child: Image.file(
                              galleryFile!,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: -25,
                        child: RawMaterialButton(
                          onPressed: () => _showPicker(context: context),
                          elevation: 2.0,
                          fillColor: Color(0xFFF5F6F9),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blue,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height*0.04),
            Text("Name ${widget.datas.name ?? ""}"),
            SizedBox(height: size.height*0.02),
            Text("Email ${widget.datas.email ?? ""}"),
          ],
        ),
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
