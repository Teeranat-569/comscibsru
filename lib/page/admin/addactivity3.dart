// ignore_for_file: prefer_collection_literals

import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Activity3 extends StatefulWidget {
  const Activity3({Key? key}) : super(key: key);

  @override
  _Activity3State createState() => _Activity3State();
}

class _Activity3State extends State<Activity3> {

  dynamic nameForm;
  var textEditController = TextEditingController();
  var collection = FirebaseFirestore.instance.collection('regis_sprcial');
 
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('แก้ไขกำหนดการลงทะเบียนเรียน\nภาคพิเศษ'),
            backgroundColor: Colors.pink[900],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  collection
                      .doc(
                          'U0bQiDYIOPI2Pxz8Ozim') // <-- Doc ID where data should be updated.
                      .update({
                    'link3': nameForm,
                  });
                  route(const Activity3());
                  Fluttertoast.showToast(
                    msg: "แก้ไขสำเร็จ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.orange[100],
                    textColor: Colors.black,
                  );
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
          body: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              nameform(),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
  
  }

  Widget nameform() {
    return TextField(
        onChanged: (value) => nameForm = value.trim(),
        controller: textEditController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: InputBorder.none,
          labelText: 'ระบุ link กำหนดการลงทะเบียนเรียน ภาคพิเศษ',
          labelStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
