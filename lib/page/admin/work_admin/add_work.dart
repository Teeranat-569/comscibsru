// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:comsci/page/admin/work_admin/add_work2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class AddWork extends StatefulWidget {
  const AddWork({Key? key}) : super(key: key);

  @override
  _AddWorkState createState() => _AddWorkState();
}

class _AddWorkState extends State<AddWork> {
  dynamic companyName, aboutCompany, pathPIC, img;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
  var _image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('ประกาศรับสมัครงานด้านไอที')),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
        
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
                companyNameform(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'เกี่ยวกับบริษัท',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                companyAboutform(),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  buttonNext(),
                  const SizedBox(
                    width: 15,
                  ),
                ])
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

  Widget companyNameform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          onChanged: (value) => companyName = value.trim(),
          controller: textEditController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            labelText: 'ระบุชื่อบริษัท',
            labelStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget companyAboutform() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          maxLines: 10,
          textDirection: TextDirection.ltr,
          onChanged: (value) => aboutCompany = value.trim(),
          controller: textEditController2,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          )),
    );
  }

  Widget buttonNext() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: const Text("ถัดไป",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () async {
          route(AddWork2(
            aboutCompany: aboutCompany,
            companyName: companyName,
            pathPIC: pathPIC,
          ));
         
          print('7777777777777777777----------bbbbb-777777777$img');
          print(' aboutCompany: ${aboutCompany}');
          print('companyName:${companyName},');
          print('path:${pathPIC},');
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: const BorderSide(color: Colors.purple)),
        color: Colors.purple,
        textColor: Colors.white,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        splashColor: Colors.grey,
      ),
    );
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

  Future<void> uploadFile(String filePath, String fileName) async {
    await Firebase.initializeApp();
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    File file = File(filePath);
    try {
      await storage.ref('company/$fileName').putFile(file);
      dynamic url = await storage.ref('company/$fileName').getDownloadURL();
      // setState(() {
      img = url;
      // downloadURLExample(fileName);
      print('7777777777777777777777777777$fileName');
      print(
          '7777777777777777777-------------------------------------777777777$img');
      print(
          '7777777777777777777------------------------555555555-------------777777777$url');
      // });
    } on firebase_core.FirebaseException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> downloadURLExample(String fileName) async {
    await Firebase.initializeApp();
    dynamic url = await firebase_storage.FirebaseStorage.instance
        .ref('company/$fileName')
        .getDownloadURL();

    setState(() {
      print(
          '7777777777777777777-------------------------------------777777777$img');
      print(
          '7777777777777777777------------------------555555555-------------777777777$url');
    });
  }
}
