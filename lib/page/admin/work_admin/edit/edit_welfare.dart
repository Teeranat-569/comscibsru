import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/edit/edit_data_workpage_admin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class EditWelfare extends StatefulWidget {
  dynamic docid, position;
  bool bonus, social, health, people, timecost, hospital, covid;
  EditWelfare(
      {Key? key,
      required this.docid,
      required this.position,
      required this.bonus,
      required this.covid,
      required this.health,
      required this.people,
      required this.social,
      required this.hospital,
      required this.timecost})
      : super(key: key);
  @override
  _EditWelfareState createState() => _EditWelfareState();
}

_EditWelfareState createState() => _EditWelfareState();

class _EditWelfareState extends State<EditWelfare> {
  final textFill = GlobalKey<FormState>();
  dynamic nameForm;
  var textEditController = TextEditingController();
  var collection = FirebaseFirestore.instance.collection('work');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('แก้ไขสวัสดิการ'),
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
                  'bonus': widget.bonus,
                  'social': widget.social,
                  'health': widget.health,
                  'people': widget.people,
                  'timeCost': widget.timecost,
                  'hospital': widget.hospital,
                  'covid': widget.covid,
                });
                route(EditDataWorkPage(docid: widget.docid,));
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
                // Text('')
                // nameform(),
                const SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: widget.bonus,
                          onChanged: (value) {
                            setState(() {
                              widget.bonus = value!;
                              print('kkkkkkkk$widget.bonus');
                              widget.bonus == true
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('เลือกสวัสดิการ โบนัส')))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('ไม่เลือกสวัสดิการ โบนัส')));
                            });
                          },
                        ),
                        const Text("โบนัส"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: widget.social,
                          onChanged: (value) {
                            setState(() {
                              widget.social = value!;
                              print('kkkkkkkk$widget.social');

                              widget.social == true
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'เลือกสวัสดิการ ประกันสังคม')))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'ไม่เลือกสวัสดิการ ประกันสังคม')));
                            });
                          },
                        ),
                        const Text("ประกันสังคม"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: widget.health,
                          onChanged: (value) {
                            setState(() {
                              widget.health = value!;
                              print('kkkkkkkk${widget.health}');
                              widget.health == true
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'เลือกสวัสดิการ ประกันสุขภาพ')))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'ไม่เลือกสวัสดิการ ประกันสุขภาพ')));
                            });
                          },
                        ),
                        const Text("ประกันสุขภาพ"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: widget.people,
                          onChanged: (value) {
                            setState(() {
                              widget.people = value!;
                              print('kkkkkkkk${widget.people}');
                              widget.people == true
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'เลือกสวัสดิการ ประกันชีวิต')))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'ไม่เลือกสวัสดิการ ประกันชีวิต')));
                            });
                          },
                        ),
                        const Text("ประกันชีวิต"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: widget.timecost,
                          onChanged: (value) {
                            setState(() {
                              widget.timecost = value!;
                              print('kkkkkkkk${widget.timecost}');
                              widget.timecost == true
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'เลือกสวัสดิการ ค่าล่วงเวลา')))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'ไม่เลือกสวัสดิการ ค่าล่วงเวลา')));
                            });
                          },
                        ),
                        const Text("ค่าล่วงเวลา"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: widget.hospital,
                          onChanged: (value) {
                            setState(() {
                              widget.hospital = value!;
                              print('kkkkkkkk${widget.hospital}');
                              widget.hospital == true
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'เลือกสวัสดิการ ค่ารักษาพยาบาล')))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'ไม่เลือกสวัสดิการ ค่ารักษาพยาบาล')));
                            });
                          },
                        ),
                        const Text("ค่ารักษาพยาบาล"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: widget.covid,
                          onChanged: (value) {
                            setState(() {
                              widget.covid = value!;
                              print('kkkkkkkk${widget.covid}');
                              widget.covid == true
                                  ? const SnackBar(
                                      content:
                                          Text('เลือกสวัสดิการ ประกันโควิด'))
                                  : const SnackBar(
                                      content: Text(
                                          'ไม่เลือกสวัสดิการ ประกันโควิด'));
                            });
                          },
                        ),
                        const Text("ประกันโควิด"),
                      ],
                    ),
                  ],
                ),
              ])),
        )));
  }

  Widget nameform() {
    return TextField(
        onChanged: (value) => nameForm = value.trim(),
        controller: textEditController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: InputBorder.none,
          labelText: 'ชื่อบริษัท',
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
