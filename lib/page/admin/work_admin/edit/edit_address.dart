import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/edit/edit_data_workpage_admin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class EditAddress extends StatefulWidget {
  String docid, position;
  EditAddress({Key? key, required this.docid, required this.position})
      : super(key: key);
  @override
  _EditAddressState createState() => _EditAddressState();
}

_EditAddressState createState() => _EditAddressState();

class _EditAddressState extends State<EditAddress> {
  final textFill = GlobalKey<FormState>();
  dynamic nameForm;
  var textEditController = TextEditingController();
  var collection = FirebaseFirestore.instance.collection('work');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('แก้ไขที่อยู่'),
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
                  'address': nameForm,
                });
                route(EditDataWorkPage(docid: widget.docid));
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
                const Text('ที่อยู่'),
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
        
         
        ));
  }

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
