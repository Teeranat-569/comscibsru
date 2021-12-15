import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/edit/edit_data_workpage_admin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class Editmore4 extends StatefulWidget {
  String docid, position;
  Editmore4({Key? key, required this.docid, required this.position})
      : super(key: key);
  @override
  _Editmore4State createState() => _Editmore4State();
}

_Editmore4State createState() => _Editmore4State();

class _Editmore4State extends State<Editmore4> {
  final textFill = GlobalKey<FormState>();
  dynamic nameForm;
  var textEditController = TextEditingController();
  var collection = FirebaseFirestore.instance.collection('work');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('แก้ไขสวัสดิการเพิ่มเติม'),
          backgroundColor: Colors.pink[900],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                collection
                    .doc(widget
                        .docid) // <-- Doc ID where data should be updated.
                    .update({
                  'more4': nameForm,
                });
                route(EditDataWorkPage());
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
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
              key: textFill,
              child: ListView(children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                Text('สวัสดิการเพิ่มเติม'),
                nameform(),
                const SizedBox(
                  height: 10.0,
                ),
              ])),
        )));
  }

  Widget nameform() {
    return TextField(
        onChanged: (value) => nameForm = value.trim(),
        controller: textEditController,
        maxLines: 5,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: InputBorder.none,
          // labelText: 'เกี่ยวกับบริษัท',
          // labelStyle: const TextStyle(
          //   fontSize: 16.0,
          //   color: Colors.grey,
          //   fontWeight: FontWeight.bold,
          // ),
        ));
  }

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
