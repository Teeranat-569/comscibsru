import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat_sns/buddhist_datetime_dateformat_sns.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class AddWork7 extends StatefulWidget {
  dynamic position,
      mission,
      companyName,
      aboutCompany,
      worktype,
      gender,
      age,
      exp,
      more4,
      amount,
      dateStop,
      name,
      phone,
      email,
      address,
      province,
      salary,
      pathPIC,
      area,
      more3;
  bool bonus, social, health, timecost, hospital, covid, people;

  AddWork7(
      {Key? key,
      this.mission,
      this.position,
      this.aboutCompany,
      this.companyName,
      this.worktype,
      this.age,
      this.exp,
      this.gender,
      this.more3,
      required this.bonus,
      required this.covid,
      required this.health,
      required this.hospital,
      required this.people,
      required this.social,
      this.more4,
      this.amount,
      this.dateStop,
      required this.timecost,
      this.address,
      this.area,
      this.email,
      this.name,
      this.phone,
      this.salary,
      this.pathPIC,
      this.province})
      : super(key: key);

  @override
  _AddWork7State createState() => _AddWork7State();
}

class _AddWork7State extends State<AddWork7> {
  dynamic more7, url, img;
  var textEditController = TextEditingController();
  var textEditController2 = TextEditingController();
  var textEditController3 = TextEditingController();
  var textEditController4 = TextEditingController();
  var textEditController5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('ประกาศรับสมัครงานด้านไอที')),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'รายละเอียดเพิ่มเติม',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
                more7form(),
                SizedBox(
                  width: 15,
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  buttonNext(),
                  SizedBox(
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

  Widget more7form() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
          maxLines: 10,
          onChanged: (value) => more7 = value.trim(),
          controller: textEditController4,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            // labelText: 'ที่อยู่ที่สามารถติดต่อได้',
            // labelStyle: const TextStyle(
            //   fontSize: 16.0,
            //   fontWeight: FontWeight.bold,
            // ),
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
          // print(' aboutCompany: ${widget.aboutCompany}');
          // print('  amount: ${widget.amount}');
          // print('  area: ${widget.area}');
          // print('companyName:${widget.companyName},');
          // print('mission: ${widget.mission}');
          print('  picCompany: $img');
          // print('province:${widget.province},');
          // print('salary: ${widget.salary},');
          // print(' status: open,');
          // print(' workPosition: ${widget.position},');
          // print('workType: ${widget.worktype},');
          // print(' name: ${widget.name},');
          // print('  phone:${widget.phone},');
          // print('  email:${widget.email}');
          // print(' address: ${widget.address},');
          // print(' gender:${widget.gender},');
          // print(' dateStop: ${widget.dateStop},');
          // print(' more3 : ${widget.more3},');
          // print(' more4: ${widget.more4},');
          // print('  more7 : ${more7}');
          // print('age: ${widget.age},');
          // print('exp: ${widget.exp},');
          // print('bonus: ${widget.bonus},');
          // print(' social: ${widget.social},');
          // print(' health:${widget.health},');
          // print('  timeCost:${widget.timecost},');
          // print(' hospital: ${widget.hospital},');
          // print('covid: ${widget.covid},');
          // print('people: ${widget.people},');
          // print('path:${widget.pathPIC},');
          addUser();
          Random random = Random();
          int i = random.nextInt(100000);
          // uploadFile(widget.pathPIC, 'img$i.jpg');
          print('7777777777777777777777777777$img');
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

  CollectionReference users = FirebaseFirestore.instance.collection('work');
  Future<void> addUser() {
    return users.add({
      'aboutCompany': widget.aboutCompany,
      'amount': widget.amount,
      'area': widget.area,
      'companyName': widget.companyName,
      'mission': widget.mission,
      'picCompany': img,
      'province': widget.province,
      'salary': widget.salary,
      'status': 'open',
      'workPosition': widget.position,
      'workType': widget.worktype,
      'name': widget.name,
      'phone': widget.phone,
      'email': widget.email,
      'address': widget.address,
      'gender': widget.gender,
      'dateStop': widget.dateStop,
      'more3': widget.more3,
      'more4': widget.more4,
      'more7': more7,
      'age': widget.age,
      'exp': widget.exp,
      'bonus': widget.bonus,
      'social': widget.social,
      'health': widget.health,
      'timeCost': widget.timecost,
      'hospital': widget.hospital,
      'covid': widget.covid,
      'people': widget.people
    }).then((value) {
      // ignore: avoid_print
      print(
          "3636363636363636363636363636363636363636363636363636363636363636User Added");
      Fluttertoast.showToast(
        msg: "เพิ่มแหล่งความรู้สำเร็จ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.purple[100],
        textColor: Colors.black,
      );
      // ignore: avoid_print, invalid_return_type_for_catch_error
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> uploadFile(String filePath, String fileName) async {
    await Firebase.initializeApp();
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    File file = File(filePath);
    try {
      await storage.ref('company/$fileName').putFile(file);

      setState(() {
        downloadURLExample(fileName);
        print('7777777777777777777777777777$fileName');
      });
    } on firebase_core.FirebaseException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> downloadURLExample(String fileName) async {
    url = await firebase_storage.FirebaseStorage.instance
        .ref('company/$fileName')
        .getDownloadURL();
    setState(() {
      img = url.toString();
      print('7777777777777777777777777777$img');
    });

    // Within your widgets:
    // Image.network(downloadURL);
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }
}
