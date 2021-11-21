import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'delmanual.dart';
import 'ex_manual.dart';

class AddManual extends StatefulWidget {
  const AddManual({Key? key}) : super(key: key);

  @override
  _AddManualState createState() => _AddManualState();
}

class _AddManualState extends State<AddManual> {
  final textFill = GlobalKey<FormState>();
  dynamic nameForm, nameManualForm;
  var textEditController = TextEditingController();
  var textEditController4 = TextEditingController();
  final CollectionReference _fireStore =
      FirebaseFirestore.instance.collection('manual');

  void addUser() {
    _fireStore.add({
      'link-manual': nameForm,
      'nameManual': nameManualForm,
    }).then((document) {
      // ignore: avoid_print
      print('4444444444444444444444444444444444444444444444444 hjgyfyi');
      debugPrint('+++++++++++++++++++++++++++++++++++' + document.id);
      Fluttertoast.showToast(
        msg: "เพิ่มคู่มือสำเร็จ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.purple[100],
        textColor: Colors.black,
      );
    });
  }

  Widget nameform() {
    return TextField(
        onChanged: (value) => nameForm = value.trim(),
        controller: textEditController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          focusColor: Colors.amber,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'ระบุ link คู่มือนักศึกษา',
          labelStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget nameManualform() {
    return TextField(
        onChanged: (value) => nameManualForm = value.trim(),
        controller: textEditController4,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: 'ระบุชื่อคู่มือนักศึกษา',
          labelStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  // ignore: prefer_void_to_null
  Future<Null> route2(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  // ignore: prefer_void_to_null
  Future<Null> route3(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).pushReplacement(materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มคู่มือนักศึกษา'),
        toolbarHeight: 40,
      ),
      body: Center(
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
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.blue[400],
                onPressed: () {
                  // ignore: curly_braces_in_flow_control_structures
                  addUser();
                  route3(const AddManual());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_circle_outline, color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'เพิ่มคู่มือ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.deepOrange[400],
                onPressed: () {
                  // ignore: curly_braces_in_flow_control_structures
                  route2(ExManual(
                    nameFormm: textEditController.text,
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                    ),
                    Text(
                      'ดูตัวอย่างคู่มือ',
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
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.red[900],
                onPressed: () {
                  route2(const DelManual());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Text(
                      'ลบคู่มือนักศึกษา',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ])),
      )),
    );
  }
}
