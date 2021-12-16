

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/add_work.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
            body: Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
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
                      route(const AddWork());
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            // ignore: avoid_unnecessary_containers
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
                           
                              Column(
                                children: [
                                  Container(
                                    width: 120,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if (data['picCompany'] == null ||
                                            data['picCompany'] == 'null' ||
                                            data['picCompany'] == '')
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 50,
                                            child: ClipOval(
                                              child: Image.asset(
                                                'images/image.png',
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        else if (data['picCompany'] != null)
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
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
                                        
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 200,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (statuss == 'เปิดรับสมัคร')
                                      Container(
                                 
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.green,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'เปิดรับสมัคร',
                                            
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    else if (statuss == 'ด่วน')
                                      Container(
                                       
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.amber[900],
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'รับสมัครด่วน',
                                           
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    else if (statuss == 'ปิดรับสมัคร')
                                      Container(
                                        
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.red[900],
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'ปิดรับสมัคร',
                                           
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
                                    const SizedBox(
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
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      'เงินเดือน/เบี้ยเลี้ยง' +
                                          '\t' +
                                          data['salary'] +
                                          '\t' +
                                          'บาท',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      data['province'] + '\t' + data['area'],
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'รับสมัครถึงวันที่',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              data['dateStop'],
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      myAlert(data['docid']);
                                      // ignore: avoid_print
                                      print(
                                          '----------------------------------' +
                                              data['docid']);
                                    
                                    },
                                    child: const Center(
                                        child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                   

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

  Future<void> route(Widget routeName) async {
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
        msg: "ลบสำเร็จ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.purple[100],
        textColor: Colors.black,
      );
      // ignore: invalid_return_type_for_catch_error, avoid_print
    }).catchError((error) => print("Failed to delete user: $error"));
  }
}
