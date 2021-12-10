import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/add_work.dart';
import 'package:comsci/page/admin/work_admin/data_workpage_admin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

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
              actions: [
                IconButton(
                    onPressed: () {
                      route(AddWork());
                    },
                    icon: Icon(Icons.add))
              ],
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
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/T-piyanan.jpg',
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
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
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
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    Text(
                                      data['workPosition'],
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.purple),
                                    ),
                                    Text(
                                      'รับสมัคร' +
                                          data['workType'] +
                                          'จำนวน' +
                                          '\t' +
                                          data['amount'].toString() +
                                          '\t' +
                                          'คน',
                                    ),
                                    Text(
                                      'เงินเดือน/เบี้ยเลี้ยง' +
                                          '\t' +
                                          data['salary'] +
                                          '\t' +
                                          'บาท',
                                    ),
                                    Text(
                                      data['province'] + '\t' + data['area'],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              FlatButton(
                                onPressed: () {
                                  route(DataWorkPage());
                                },
                                child: const Text(
                                  'ดูรายละเอียด >>>',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                                // height: ,
                              ),
                            ],
                          ),
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
}
