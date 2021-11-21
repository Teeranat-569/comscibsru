

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'deledutech.dart';

class AddTech extends StatefulWidget {
  const AddTech({Key? key}) : super(key: key);

  @override
  _AddTechState createState() => _AddTechState();
}

class _AddTechState extends State<AddTech> {
  dynamic nameTitle, linkTitle, conclusion;
  var textEditController = TextEditingController();
  var textEditController3 = TextEditingController();
  var textEditController4 = TextEditingController();
  final textFill = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เพิ่มแหล่งความรู้เทคโนโลยี')),
      body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: textFill,
                child: ListView(children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  nameManualform(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  nameform(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  conclusionform(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.blue[400],
                    onPressed: () {
                      // ignore: curly_braces_in_flow_control_structures
                      addUser();
                      route3(const AddTech());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'เพิ่มแหล่งความรู้',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.red[900],
                    onPressed: () {
                      route2(const DelEduTech());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        Text(
                          'ลบแหล่งความรู้',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ])),
          ))),
    );
  }

  Widget nameform() {
    return TextField(
        onChanged: (value) => linkTitle = value.trim(),
        controller: textEditController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'ระบุ link แหล่งความรู้',
          labelStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget nameManualform() {
    return TextField(
        onChanged: (value) => nameTitle = value.trim(),
        controller: textEditController4,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'ระบุชื่อแหล่งความรู้',
          labelStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget conclusionform() {
    return TextField(
        onChanged: (value) => conclusion = value.trim(),
        controller: textEditController3,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'เพิ่มบทความสั้นๆ',
          labelStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  CollectionReference users = FirebaseFirestore.instance.collection('eduTech');
  Future<void> addUser() {
    return users.add({
      'nameTitle': nameTitle, 
      'linkTitle': linkTitle, 
      'conclu': conclusion 
    }).then((value) {
      // ignore: avoid_print
      print("User Added");
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

  Future<void> route2(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).pushReplacement(materialPageRoute);
  }

  // ignore: prefer_void_to_null
  Future<Null> route3(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
