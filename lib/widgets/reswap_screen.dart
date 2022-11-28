// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_import, prefer_typing_uninitialized_variables, avoid_print, unused_import, non_constant_identifier_names, use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ReSwapScreen extends StatefulWidget {
  final link;
  const ReSwapScreen({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  State<ReSwapScreen> createState() => _ReSwapScreenState();
}

class _ReSwapScreenState extends State<ReSwapScreen> {
  String SelectedImagepath = '';
  @override
  Widget build(BuildContext context) {
    print(widget.link);
    print('69');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4,
              ),
              Container(
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                      ),
                    ),
                    SizedBox(
                      width: 220,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text('Reswap'),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(Icons.swap_horiz),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('pictures1/Final logo .PNG'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Reswaping as ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Naman Shukla',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    width: 30,
                    child: IconButton(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(0),
                      onPressed: () async {
                        print('hell');
                        PermissionStatus StorageStatus =
                            await Permission.storage.request();
                        print('heelo');
                        if (StorageStatus == PermissionStatus.granted) {
                          SelectedImagepath = await selectImageFromGallery();
                          print('Image_Path:-');
                          print(SelectedImagepath);
                          if (SelectedImagepath != '') {
                            // Navigator.pop(context);
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("No Image Selected !"),
                            ));
                          }
                        }
                        if (StorageStatus == PermissionStatus.denied) {
                          print('permission denied');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("This Permission is recommended."),
                            ),
                          );
                        }
                        if (StorageStatus ==
                            PermissionStatus.permanentlyDenied) {
                          openAppSettings();
                        }
                      },
                      icon: Icon(
                        Icons.image_search,
                        size: 26,
                        color: Colors.indigo.shade900,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                // color: Colors.green,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.emailAddress,
                    cursorHeight: 22,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What's new?",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SelectedImagepath == ''
                    ? SizedBox(height: 0)
                    : Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // height: 400,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: FileImage(
                                    File(SelectedImagepath),
                                    // height: 200,
                                    // width: 200,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: NetworkImage(
                          widget.link,
                        ),
                        // color: Colors.blue,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: 10,
              //   width: double.infinity,
              //   color: Colors.green,
              // )
            ],
          ),
        ),
      ),
    );
  }
}

selectImageFromGallery() async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 10);
  if (file != null) {
    return file.path;
  } else {
    return '';
  }
}

selectImageFromCamera() async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 10);
  if (file != null) {
    return file.path;
  } else {
    return '';
  }
}