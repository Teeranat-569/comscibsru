import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/edit/edit_data_workpage_admin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class EditStatus extends StatefulWidget {
  String docid, position;
  EditStatus({Key? key, required this.docid, required this.position})
      : super(key: key);
  @override
  _EditStatusState createState() => _EditStatusState();
}

_EditStatusState createState() => _EditStatusState();

class _EditStatusState extends State<EditStatus> {
  final textFill = GlobalKey<FormState>();
  dynamic nameForm, _chosenValue;
  var textEditController = TextEditingController();
  var collection = FirebaseFirestore.instance.collection('work');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('แก้ไขรูปแบบงาน'),
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
                  'status': _chosenValue,
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
                // Text('รูปแบบงาน'),
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
          'สถานะ : ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        // const SizedBox(),
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
              items: <String>['เปิดรับสมัคร', 'ด่วน', 'ปิดรับสมัคร']
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
                  "เลือกสถานะ",
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

  // ignore: prefer_void_to_null
  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    Navigator.of(context).pushReplacement(materialPageRoute);
  }
}
