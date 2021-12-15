import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/add_work.dart';
import 'package:comsci/page/admin/work_admin/data_workpage_admin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'edit/edit_data_workpage_admin.dart';

class WorkPageAdmin extends StatefulWidget {
  const WorkPageAdmin({Key? key}) : super(key: key);

  @override
  _WorkPageAdminState createState() => _WorkPageAdminState();
}

class _WorkPageAdminState extends State<WorkPageAdmin> {
  dynamic statuss, amount;
  dynamic _image;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('work').snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('work');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          );
        }

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('ประกาศรับสมัครงาน'),
            ),
            body: Container(
              // color: Colors.purple[50],
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  data["docid"] = document.id;
                  statuss = data['status'];
                  amount = data['amount'];

                  // ignore: avoid_print
                  print('4444444444444444444444444 ${data["docid"]}');
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade200,
                      ),
                      width: MediaQuery.of(context).size.width,
                      // ignore: deprecated_member_use
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Icon(
                              //   Icons.tab,
                              //   color: Colors.blue[200],
                              // ),
                              Container(
                                width: 120,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 50,
                                      child: ClipOval(
                                        child: Image.network(
                                          data['picCompany'],
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      data['companyName'],
                                      // maxLines: 3,
                                      // overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (statuss == 'open')
                                      Container(
                                        // color: Colors.green,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.green,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'เปิดรับสมัคร',
                                            // maxLines: 2,
                                            // overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    Text(
                                      data['workPosition'],
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.purple),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'รับสมัคร' +
                                          data['workType'] +
                                          '\n' +
                                          'จำนวน' +
                                          '\t' +
                                          data['amount'].toString() +
                                          '\t' +
                                          'คน',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'เงินเดือน/เบี้ยเลี้ยง' +
                                          '\t' +
                                          data['salary'] +
                                          '\t' +
                                          'บาท',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      data['province'] + '\t' + data['area'],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              FlatButton(
                                onPressed: () {
                                  route(DataWorkPage(
                                    docid: data['docid'],
                                  ));
                                  print(
                                      '******************************* ${data['docid']}');
                                },
                                child: const Text(
                                  'ดูรายละเอียด >>>',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      myAlert(data['docid']);
                                      // ignore: avoid_print
                                      print('----------------------------------' +
                                          data['docid']);
                                      // ignore: avoid_print
                                      print(
                                          '----------------------------nnnnn------' +
                                              data['nameManual']);
                                    },
                                    child: const Center(
                                        child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                                  ),
                                   FlatButton(
                                    onPressed: () {
                                      // myAlert(data['docid']);
                                      // // ignore: avoid_print
                                      // print('----------------------------------' +
                                      //     data['docid']);
                                      // // ignore: avoid_print
                                      // print(
                                      //     '----------------------------nnnnn------' +
                                      //         data['nameManual']);

                                        route(EditDataWorkPage(
                                    docid: data['docid'],
                                  ));
                                  print(
                                      '******************************* ${data['docid']}');
                                    },
                                    child: const Center(
                                        child: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }

  void myAlert(String docid) {
    showDialog(
        context: context,
        builder: (BuildContext constext) {
          return AlertDialog(
            title: const Text('คุณแน่ใจใช่ไหม?'),
            content: const Text('คุณต้องการที่จะลบรายการนี้?'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child:
                    const Text('ยกเลิก', style: TextStyle(color: Colors.red)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              // ignore: deprecated_member_use
              FlatButton(
                child: const Text('ใช่', style: TextStyle(color: Colors.green)),
                onPressed: () {
                  deleteData(docid).then((value) {
                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          );
        });
  }

  Future<void> deleteData(String docid) {
    return users.doc(docid).delete().then((value) {
      // ignore: avoid_print
      print("User Deleted");
      Fluttertoast.showToast(
        msg: "ลบแหล่งความรู้สำเร็จ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.purple[100],
        textColor: Colors.black,
      );
      // ignore: invalid_return_type_for_catch_error, avoid_print
    }).catchError((error) => print("Failed to delete user: $error"));
  }
}
