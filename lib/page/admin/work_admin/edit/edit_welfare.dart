import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/edit/edit_data_workpage_admin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class EditWelfare extends StatefulWidget {
  dynamic docid, position, bonus, social, health, people, timecost, covid;
  EditWelfare(
      {Key? key,
      required this.docid,
      required this.position,
      required this.bonus,
      required this.covid,
      required this.health,
      required this.people,
      required this.social,
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

  var b ='${ widget.bonus}';
  bool bonus = widget.bonus;

  var val = 'True';
bool b = val.toLowerCase() == 'true';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('แก้ไขชื่อบริษัท'),
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
                  'companyName': nameForm,
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
                // Text('')
                nameform(),
                const SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                        Widget>[
                      Checkbox(
                        value: bonus,
                        onChanged: (value) {
                          setState(() {
                            bonus = value!;
                            print('kkkkkkkk$bonus');
                            bonus == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('เลือกสวัสดิการ โบนัส')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('ไม่เลือกสวัสดิการ โบนัส')));
                          });
                        },
                      ),
                      const Text("โบนัส"),
                      Checkbox(
                        value: social,
                        onChanged: (value) {
                          setState(() {
                            social = value!;
                            print('kkkkkkkk$social');

                            social == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('เลือกสวัสดิการ ประกันสังคม')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'ไม่เลือกสวัสดิการ ประกันสังคม')));
                          });
                        },
                      ),
                      const Text("ประกันสังคม"),
                      Checkbox(
                        value: health,
                        onChanged: (value) {
                          setState(() {
                            health = value!;
                            print('kkkkkkkk$health');
                            health == true
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
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                        Widget>[
                      Checkbox(
                        value: people,
                        onChanged: (value) {
                          setState(() {
                            people = value!;
                            print('kkkkkkkk$people');
                            people == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('เลือกสวัสดิการ ประกันชีวิต')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'ไม่เลือกสวัสดิการ ประกันชีวิต')));
                          });
                        },
                      ),
                      const Text("ประกันชีวิต"),
                      Checkbox(
                        value: timecost,
                        onChanged: (value) {
                          setState(() {
                            timecost = value!;
                            print('kkkkkkkk$timecost');
                            timecost == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('เลือกสวัสดิการ ค่าล่วงเวลา')))
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'ไม่เลือกสวัสดิการ ค่าล่วงเวลา')));
                          });
                        },
                      ),
                      const Text("ค่าล่วงเวลา"),
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                        Widget>[
                      Checkbox(
                        value: hospital,
                        onChanged: (value) {
                          setState(() {
                            hospital = value!;
                            print('kkkkkkkk$hospital');
                            hospital == true
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
                      Checkbox(
                        value: covid,
                        onChanged: (value) {
                          setState(() {
                            covid = value!;
                            print('kkkkkkkk$covid');
                            covid == true
                                ? const SnackBar(
                                    content: Text('เลือกสวัสดิการ ประกันโควิด'))
                                : const SnackBar(
                                    content:
                                        Text('ไม่เลือกสวัสดิการ ประกันโควิด'));
                          });
                        },
                      ),
                      const Text("ประกันโควิด"),
                    ]),
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
