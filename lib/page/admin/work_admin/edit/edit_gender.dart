import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/edit/edit_data_workpage_admin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class EditGender extends StatefulWidget {
  String docid, position;
  EditGender({Key? key, required this.docid, required this.position})
      : super(key: key);
  @override
  _EditGenderState createState() => _EditGenderState();
}

_EditGenderState createState() => _EditGenderState();

class _EditGenderState extends State<EditGender> {
  final textFill = GlobalKey<FormState>();
  dynamic nameForm, _chosenValue;
  var textEditController = TextEditingController();
  var collection = FirebaseFirestore.instance.collection('work');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('แก้ไขเพศ'),
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
                  'gender': _chosenValue,
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
            
                dropDown(),
                const SizedBox(
                  height: 10.0,
                ),
              ])),
        )));
  }

  Widget dropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'เพศ : ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: DropdownButton<String>(
              focusColor: Colors.white,
              value: _chosenValue,
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: <String>['ชาย', 'หญิง', 'ชายและหญิง']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'Mitr'),
                  ),
                );
              }).toList(),
              hint: const Center(
                child: Text(
                  "เลือกเพศ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mitr'),
                ),
              ),
              onChanged: (dynamic value) {
                setState(() {
                  _chosenValue = value;
                  print(_chosenValue);
                  print('66666666666' + value);
                });
              },
            ),
          ),
        ),
      ],
    );
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
