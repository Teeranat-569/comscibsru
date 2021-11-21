import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Activity2 extends StatefulWidget {
  const Activity2({Key? key}) : super(key: key);

  @override
  _Activity2State createState() => _Activity2State();
}

class _Activity2State extends State<Activity2> {
  final textFill = GlobalKey<FormState>();
  dynamic nameForm;
  var textEditController = TextEditingController();
  var collection = FirebaseFirestore.instance.collection('regis');


  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('แก้ไขกำหนดการลงทะเบียนเรียน\nภาคปกติ'),
            backgroundColor: Colors.pink[900],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  collection.doc('1EVFbI2caofXpXvbF7gd').update({
                    'link2': nameForm,
                  });
                  route(const Activity2());
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
          body:  Center(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
                key: textFill,
                child: ListView(children: <Widget>[
              
                  const SizedBox(
                    height: 10.0,
                  ),
                  nameform(),
                  const SizedBox(
                    height: 10.0,
                  ),
                ])),
          )),
       
          
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
          labelText: 'ระบุ link กำหนดการลงทะเบียนเรียน ภาคปกติ',
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
    Navigator.of(context).pushReplacement(materialPageRoute);
  }

 
}
