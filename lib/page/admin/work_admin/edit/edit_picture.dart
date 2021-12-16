// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/add_work2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'edit_data_workpage_admin.dart';

class EditPicture extends StatefulWidget {
  String docid, position;
  EditPicture({Key? key, required this.docid, required this.position})
      : super(key: key);

  @override
  _EditPictureState createState() => _EditPictureState();
}

class _EditPictureState extends State<EditPicture> {
  dynamic companyName, aboutCompany, pathPIC, url, img;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
  var collection = FirebaseFirestore.instance.collection('work');
  var _image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('แก้ไขรูปภาพ')),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {
                Fluttertoast.showToast(
                  msg: "แก้ไขสำเร็จ",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.orange[100],
                  textColor: Colors.black,
                );

                Random random = Random();
                int i = random.nextInt(100000);
                await Firebase.initializeApp();
                final firebase_storage.FirebaseStorage storage =
                    firebase_storage.FirebaseStorage.instance;
                File file = File(pathPIC);
                try {
                  await storage.ref('company/img$i').putFile(file);
                  dynamic url =
                      await storage.ref('company/img$i').getDownloadURL();
                  // setState(() {
                  img = url;
                  // downloadURLExample(fileName);
                  route(EditDataWorkPage(docid: widget.docid));
                  print('7777777777777777777777777777img$i');

                  // });
                } on firebase_core.FirebaseException catch (e) {
                  // ignore: avoid_print
                  print(e);
                }
                print(
                    '7777777777777777777-------------------------------------777777777$img');

                collection
                    .doc(widget
                        .docid) // <-- Doc ID where data should be updated.
                    .update({
                  'picCompany': img,
                });
              },
              child: const Icon(
                Icons.save,
                size: 40.0,
              ),
              backgroundColor: Colors.pink,
              tooltip: 'บันทึกกิจกรรม',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'รูปภาพบริษัท',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                showImage(),
                IconButton(
                    onPressed: () {
                      getImage();
                    },
                    icon: const Icon(
                      Icons.file_upload,
                      size: 40,
                    )),
                const SizedBox(
                  height: 15,
                ),
                // companyNameform(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showImage() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        width: 300.0,
        height: 200.0,
        child: _image == null
            ? Center(child: Text('ไม่ได้อัปโหลดรูปภาพ'))
            : ClipRect(
                child: InteractiveViewer(
                    maxScale: 20, child: Image.file(_image))));
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        pathPIC = pickedFile.path;
        print('ffffffffffffffffffffffffffffs' + pathPIC);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }
}
