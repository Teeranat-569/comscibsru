import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comsci/page/admin/work_admin/edit/edit_picture.dart';
import 'package:comsci/page/admin/work_admin/edit/edit_position.dart';
import 'package:flutter/material.dart';

import 'edit_about.dart';
import 'edit_address.dart';
import 'edit_age.dart';
import 'edit_amount.dart';
import 'edit_companyname.dart';
import 'edit_datestop.dart';
import 'edit_email.dart';
import 'edit_exp.dart';
import 'edit_gender.dart';
import 'edit_mission.dart';
import 'edit_more3.dart';
import 'edit_more4.dart';
import 'edit_more7.dart';
import 'edit_name.dart';
import 'edit_phone.dart';
import 'edit_province.dart';
import 'edit_status.dart';
import 'edit_welfare.dart';
import 'edit_worktype.dart';

// ignore: must_be_immutable
class EditDataWorkPage extends StatefulWidget {
  dynamic companyName,
      docid,
      aboutCompany,
      workType,
      workPosition,
      mission,
      salary,
      status,
      amount,
      picCompany,
      nameANDlast,
      phone,
      address,
      eMail,
      province,
      area;
  EditDataWorkPage(
      {Key? key,
      this.aboutCompany,
      this.address,
      this.amount,
      this.area,
      this.companyName,
      this.eMail,
      this.mission,
      this.nameANDlast,
      this.phone,
      this.picCompany,
      this.province,
      this.salary,
      this.status,
      this.workPosition,
      this.docid,
      this.workType})
      : super(key: key);

  @override
  _EditDataWorkPageState createState() => _EditDataWorkPageState();
}

class _EditDataWorkPageState extends State<EditDataWorkPage> {
  dynamic statuss, amount;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('work').snapshots();
  var textEditController = TextEditingController();
  dynamic position,
      mission,
      companyName,
      aboutCompany,
      worktype,
      gender,
      age,
      exp,
      more3,
      more4,
      dateStop,
      name,
      phone,
      email,
      address,
      province,
      salary,
      pathPIC,
      status,
      more7,
      area;
  late bool bonus, social, health, timecost, hospital, covid, people;

  bool show = true;

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('แก้ไขประกาศรับสมัครงาน'),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              show
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.amber,
                    ))
                  : SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              width: MediaQuery.of(context).size.width,
                              // ignore: deprecated_member_use
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 120,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            if (pathPIC == null ||
                                                pathPIC == '')
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
                                            else
                                              CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 50,
                                                child: ClipOval(
                                                  child: Image.network(
                                                    pathPIC,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                color: Colors.grey.shade200,
                                              ),
                                              child: FlatButton(
                                                onPressed: () {
                                                  route(EditPicture(
                                                    docid: widget.docid,
                                                    position: position,
                                                  ));
                                                  print(
                                                      '******************************* ${widget.docid}');
                                                },
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.edit,
                                                  size: 16,
                                                  color: Colors.blue,
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        width: 220,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Text('สถานะ : '),
                                                if (status == 'เปิดรับสมัคร')
                                                  Container(
                                                    // color: Colors.green,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: Colors.green,
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'เปิดรับสมัคร',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                else if (status == 'ด่วน')
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: Colors.amber[900],
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'รับสมัครด่วน',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  )
                                                else if (status ==
                                                    'ปิดรับสมัคร')
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: Colors.red[900],
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'ปิดรับสมัคร',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                Container(
                                                  width: 50,
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      route(EditStatus(
                                                        docid: widget.docid,
                                                        position: position,
                                                      ));
                                                      print(
                                                          '******************************* ${widget.docid}');
                                                    },
                                                    child: const Center(
                                                        child: Icon(
                                                      Icons.edit,
                                                      size: 16,
                                                      color: Colors.blue,
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                lineProgress(
                                                  position,
                                                  const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.purple),
                                                ),
                                                Container(
                                                  width: 50,
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      route(EditPosition(
                                                        docid: widget.docid,
                                                        position: position,
                                                      ));
                                                      print(
                                                          '******************************* ${widget.docid}');
                                                    },
                                                    child: const Center(
                                                        child: Icon(
                                                      Icons.edit,
                                                      size: 16,
                                                      color: Colors.blue,
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                lineProgress(
                                                    companyName,
                                                    const TextStyle(
                                                        fontSize: 14)),
                                                Container(
                                                  width: 20,
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      route(EditCompanyName(
                                                        docid: widget.docid,
                                                        position: companyName,
                                                      ));
                                                      print(
                                                          '******************************* ${widget.docid}');
                                                    },
                                                    child: const Center(
                                                        child: Icon(
                                                      Icons.edit,
                                                      size: 16,
                                                      color: Colors.blue,
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        // color: Colors.green,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.purple,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'เกี่ยวกับบริษัท',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50,
                                        child: FlatButton(
                                          onPressed: () {
                                            route(EditAbout(
                                              docid: widget.docid,
                                              position: aboutCompany,
                                            ));
                                            print(
                                                '******************************* ${widget.docid}');
                                          },
                                          child: const Center(
                                              child: Icon(
                                            Icons.edit,
                                            size: 16,
                                            color: Colors.blue,
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: 340,
                                        child: lineProgressIMG(
                                          aboutCompany,
                                          const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.grey.shade200,
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      // ignore: deprecated_member_use
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'รับสมัคร' + '$worktype',
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    child: FlatButton(
                                                      onPressed: () {
                                                        route(EditWorkType(
                                                          docid: widget.docid,
                                                          position: worktype,
                                                        ));
                                                        print(
                                                            '******************************* ${widget.docid}');
                                                      },
                                                      child: const Center(
                                                          child: Icon(
                                                        Icons.edit,
                                                        size: 16,
                                                        color: Colors.blue,
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'จำนวน' +
                                                          '\t' +
                                                          amount.toString() +
                                                          '\t' +
                                                          'คน',
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    child: FlatButton(
                                                      onPressed: () {
                                                        route(EditAmount(
                                                          docid: widget.docid,
                                                          position: amount,
                                                        ));
                                                        print(
                                                            '******************************* ${widget.docid}');
                                                      },
                                                      child: const Center(
                                                          child: Icon(
                                                        Icons.edit,
                                                        size: 16,
                                                        color: Colors.blue,
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'รับสมัครถึงวันที่   ',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          dateStop,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16),
                                                        ),
                                                        Container(
                                                          width: 50,
                                                          child: FlatButton(
                                                            onPressed: () {
                                                              route(EditDate(
                                                                docid: widget
                                                                    .docid,
                                                                position:
                                                                    amount,
                                                              ));
                                                              print(
                                                                  '******************************* ${widget.docid}');
                                                            },
                                                            child: const Center(
                                                                child: Icon(
                                                              Icons.edit,
                                                              size: 16,
                                                              color:
                                                                  Colors.blue,
                                                            )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          color: Colors.purple,
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            'คุณสมบัติ',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        width: 250,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  'เพศ : ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                lineProgress(
                                                                    gender,
                                                                    const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                    )),
                                                                Container(
                                                                  width: 50,
                                                                  child:
                                                                      FlatButton(
                                                                    onPressed:
                                                                        () {
                                                                      route(
                                                                          EditGender(
                                                                        docid: widget
                                                                            .docid,
                                                                        position:
                                                                            gender,
                                                                      ));
                                                                      print(
                                                                          '******************************* ${widget.docid}');
                                                                    },
                                                                    child: const Center(
                                                                        child: Icon(
                                                                      Icons
                                                                          .edit,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .blue,
                                                                    )),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  'อายุ : ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                lineProgress(
                                                                    age,
                                                                    const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                    )),
                                                                const Text(
                                                                  ' ปี',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Container(
                                                                  width: 50,
                                                                  child:
                                                                      FlatButton(
                                                                    onPressed:
                                                                        () {
                                                                      route(
                                                                          EditAge(
                                                                        docid: widget
                                                                            .docid,
                                                                        position:
                                                                            age,
                                                                      ));
                                                                      print(
                                                                          '******************************* ${widget.docid}');
                                                                    },
                                                                    child: const Center(
                                                                        child: Icon(
                                                                      Icons
                                                                          .edit,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .blue,
                                                                    )),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  'ประสบการณ์ : ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                lineProgress(
                                                                    exp,
                                                                    const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                    )),
                                                                const Text(
                                                                  ' ปี',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Container(
                                                                  width: 50,
                                                                  child:
                                                                      FlatButton(
                                                                    onPressed:
                                                                        () {
                                                                      route(
                                                                          EditExp(
                                                                        docid: widget
                                                                            .docid,
                                                                        position:
                                                                            exp,
                                                                      ));
                                                                      print(
                                                                          '******************************* ${widget.docid}');
                                                                    },
                                                                    child: const Center(
                                                                        child: Icon(
                                                                      Icons
                                                                          .edit,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .blue,
                                                                    )),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  'คุณสมบัติเพิ่มเติม : ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Container(
                                                                  width: 50,
                                                                  child:
                                                                      FlatButton(
                                                                    onPressed:
                                                                        () {
                                                                      route(
                                                                          Editmore3(
                                                                        docid: widget
                                                                            .docid,
                                                                        position:
                                                                            more3,
                                                                      ));
                                                                      print(
                                                                          '******************************* ${widget.docid}');
                                                                    },
                                                                    child: const Center(
                                                                        child: Icon(
                                                                      Icons
                                                                          .edit,
                                                                      size: 16,
                                                                      color: Colors
                                                                          .blue,
                                                                    )),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 300,
                                                              child: lineProgressIMG3(
                                                                  more3,
                                                                  const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.grey.shade200,
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      // ignore: deprecated_member_use
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          color: Colors.purple,
                                                        ),
                                                        child: Row(
                                                          children: const [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                'หน้าที่ความรับผิดชอบ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 50,
                                                        child: FlatButton(
                                                          onPressed: () {
                                                            route(EditMission(
                                                              docid:
                                                                  widget.docid,
                                                              position: mission,
                                                            ));
                                                            print(
                                                                '******************************* ${widget.docid}');
                                                          },
                                                          child: const Center(
                                                              child: Icon(
                                                            Icons.edit,
                                                            size: 16,
                                                            color: Colors.blue,
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      lineProgressIMG(
                                                          mission,
                                                          const TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        // color: Colors.green,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          color: Colors.purple,
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            'สวัสดิการ',
                                                            // maxLines: 2,
                                                            // overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 50,
                                                            child: FlatButton(
                                                              onPressed: () {
                                                                route(EditWelfare(
                                                                    docid: widget
                                                                        .docid,
                                                                    position:
                                                                        '',
                                                                    bonus:
                                                                        bonus,
                                                                    covid:
                                                                        covid,
                                                                    health:
                                                                        health,
                                                                    people:
                                                                        people,
                                                                    social:
                                                                        social,
                                                                    timecost:
                                                                        timecost,
                                                                    hospital:
                                                                        hospital));
                                                                print(
                                                                    '******************************* ${widget.docid}');
                                                              },
                                                              child:
                                                                  const Center(
                                                                      child:
                                                                          Icon(
                                                                Icons.edit,
                                                                size: 16,
                                                                color:
                                                                    Colors.blue,
                                                              )),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              if (bonus ==
                                                                      'true' ||
                                                                  bonus == true)
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .pink,
                                                                  ),
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(
                                                                          Icons
                                                                              .check),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          'โบนัส',
                                                                          // maxLines: 2,
                                                                          // overflow: TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              else
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'โบนัส',
                                                                      // maxLines: 2,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              if (social ==
                                                                      'true' ||
                                                                  social ==
                                                                      true)
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .pink,
                                                                  ),
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(
                                                                          Icons
                                                                              .check),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          'ประกันสังคม',
                                                                          // maxLines: 2,
                                                                          // overflow: TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              else
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'ประกันสังคม',
                                                                      // maxLines: 2,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              if (health ==
                                                                      'true' ||
                                                                  health ==
                                                                      true)
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .pink,
                                                                  ),
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(
                                                                          Icons
                                                                              .check),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          'ประกันสุขภาพ',
                                                                          // maxLines: 2,
                                                                          // overflow: TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              else
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'ประกันสุขภาพ',
                                                                      // maxLines: 2,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              if (timecost ==
                                                                      'true' ||
                                                                  timecost ==
                                                                      true)
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .pink,
                                                                  ),
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(
                                                                          Icons
                                                                              .check),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          'ค่าล่วงเวลา',
                                                                          // maxLines: 2,
                                                                          // overflow: TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              else
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'ค่าล่วงเวลา',
                                                                      // maxLines: 2,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              if (hospital ==
                                                                      'true' ||
                                                                  hospital ==
                                                                      true)
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .pink,
                                                                  ),
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(
                                                                          Icons
                                                                              .check),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          'ค่ารักษาพยาบาล',
                                                                          // maxLines: 2,
                                                                          // overflow: TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              else
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'ค่ารักษาพยาบาล',
                                                                      // maxLines: 2,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              if (covid ==
                                                                      'true' ||
                                                                  covid == true)
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .pink,
                                                                  ),
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(
                                                                          Icons
                                                                              .check),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          'ประกันโควิด',
                                                                          // maxLines: 2,
                                                                          // overflow: TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              else
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'ประกันโควิด',
                                                                      // maxLines: 2,
                                                                      // overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              if (people ==
                                                                      'true' ||
                                                                  people ==
                                                                      true)
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .pink,
                                                                  ),
                                                                  child: Row(
                                                                    children: const [
                                                                      Icon(Icons
                                                                          .check),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          'ประกันชีวิต',
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              else
                                                                Container(
                                                                  // color: Colors.green,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  child:
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'ประกันชีวิต',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                  'สวัสดิการเพิ่มเติม :'),
                                              Container(
                                                width: 50,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    route(Editmore4(
                                                      docid: widget.docid,
                                                      position: more4,
                                                    ));
                                                    print(
                                                        '******************************* ${widget.docid}');
                                                  },
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.edit,
                                                    size: 16,
                                                    color: Colors.blue,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          lineProgress(
                                              more4,
                                              const TextStyle(
                                                fontSize: 12,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        // color: Colors.green,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          color: Colors.purple,
                                                        ),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            'ข้อมูลติดต่อกลับ',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              lineProgress(
                                                  name,
                                                  const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              Container(
                                                width: 50,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    route(EditName(
                                                      docid: widget.docid,
                                                      position: name,
                                                    ));
                                                    print(
                                                        '******************************* ${widget.docid}');
                                                  },
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.edit,
                                                    size: 16,
                                                    color: Colors.blue,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              lineProgress(
                                                  phone,
                                                  const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              Container(
                                                width: 50,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    route(EditPhone(
                                                      docid: widget.docid,
                                                      position: phone,
                                                    ));
                                                    print(
                                                        '******************************* ${widget.docid}');
                                                  },
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.edit,
                                                    size: 16,
                                                    color: Colors.blue,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              lineProgress(
                                                  email,
                                                  const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              Container(
                                                width: 50,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    route(EditEmail(
                                                      docid: widget.docid,
                                                      position: email,
                                                    ));
                                                    print(
                                                        '******************************* ${widget.docid}');
                                                  },
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.edit,
                                                    size: 16,
                                                    color: Colors.blue,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 280,
                                                child: lineProgress(
                                                    address,
                                                    const TextStyle(
                                                      fontSize: 12,
                                                    )),
                                              ),
                                              Container(
                                                width: 50,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    route(EditAddress(
                                                      docid: widget.docid,
                                                      position: address,
                                                    ));
                                                    print(
                                                        '******************************* ${widget.docid}');
                                                  },
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.edit,
                                                    size: 16,
                                                    color: Colors.blue,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              lineProgress(
                                                  province,
                                                  const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              lineProgress(
                                                  area,
                                                  const TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              Container(
                                                width: 50,
                                                child: FlatButton(
                                                  onPressed: () {
                                                    route(EditProvince(
                                                      docid: widget.docid,
                                                      position: province,
                                                      area: area,
                                                    ));
                                                    print(
                                                        '******************************* ${widget.docid}');
                                                  },
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.edit,
                                                    size: 16,
                                                    color: Colors.blue,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
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
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        // color: Colors.green,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          color: Colors.purple,
                                                        ),
                                                        child: Row(
                                                          children: const [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                'รายละเอียดเพิ่มเติม',
                                                                // maxLines: 2,
                                                                // overflow: TextOverflow.ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        width: 50,
                                                        child: FlatButton(
                                                          onPressed: () {
                                                            route(Editmore7(
                                                              docid:
                                                                  widget.docid,
                                                              position: more7,
                                                            ));
                                                            print(
                                                                '******************************* ${widget.docid}');
                                                          },
                                                          child: const Center(
                                                              child: Icon(
                                                            Icons.edit,
                                                            size: 16,
                                                            color: Colors.blue,
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              lineProgress(
                                                  more7,
                                                  const TextStyle(
                                                    fontSize: 12,
                                                  ))
                                            ],
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
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lineProgress(data, TextStyle style) {
    return data == null
        ? const LinearProgressIndicator()
        : Text(
            data,
            style: style,
          );
  }

  Widget lineProgressIMG(data, TextStyle style) {
    return data == null
        ? const LinearProgressIndicator()
        : Text(
            data,
            style: style,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          );
  }

  Widget lineProgressIMG3(data, TextStyle style) {
    return data == null
        ? const LinearProgressIndicator()
        : Text(
            data,
            style: style,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          );
  }

  Widget lineProgressIMG2(data, TextStyle style) {
    return data == null
        ? const LinearProgressIndicator()
        : Flexible(
            child: Text(
              data,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            ),
          );
  }

  //   StreamBuilder(
  //         stream: FirebaseFirestore.instance
  //             .collection('YOUR COLLECTION NAME')
  //             .doc(id) //ID OF DOCUMENT
  //             .snapshots(),
  //       builder: (context, snapshot) {
  //       if (!snapshot.hasData) {
  //         return new CircularProgressIndicator();
  //       }
  //       var document = snapshot.data;
  //       return new Text('${document}');
  //    }
  // );

  Future<void> get() async {
    FirebaseFirestore.instance
        .collection('work')
        .doc(widget.docid)
        .get()
        .then((value) {
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
      print('+++++++++++++++++++++++++++++++++++${value['workPosition']}');
      print('+++++++++++++++++++++++++++++++++++${value['aboutCompany']}');
      print('+++++++++++++++++++++++++++++++++++${value['amount']}');
      print('+++++++++++++++++++++++++++++++++++${value['area']}');
      print('+++++++++++++++++++++++++++++++++++${value['companyName']}');
      print('+++++++++++++++++++++++++++++++++++${value['mission']}');
      print('+++++++++++++++++++++++++++++++++++${value['picCompany']}');
      print('+++++++++++++++++++++++++++++++++++${value['province']}');
      print('+++++++++++++++++++++++++++++++++++${value['salary']}');
      print('+++++++++++++++++++++++++++++++++++${value['status']}');
      print('+++++++++++++++++++++++++++++++++++${value['workType']}');
      print('+++++++++++++++++++++++++++++++++++${value['phone']}');
      print('+++++++++++++++++++++++++++++++++++${value['email']}');
      print('+++++++++++++++++++++++++++++++++++${value['address']}');
      print('+++++++++++++++++++++++++++++++++++${value['gender']}');
      print('+++++++++++++++++++++++++++++++++++${value['dateStop']}');
      print('+++++++++++++++++++++++++++++++++++${value['more3']}');
      print('+++++++++++++++++++++++++++++++++++${value['more4']}');
      print('+++++++++++++++++++++++++++++++++++${value['bonus']}');
      print('+++++++++++++++++++++++++++++++++++${value['health']}');
      print('+++++++++++++++++++++++++++++++++++${value['hospital']}');
      print('+++++++++++++++++++++++++++++++++++${value['social']}');
      print('+++++++++++++++++++++++++++++++++++${value['timeCost']}');
      print('+++++++++++++++++++++++++++++++++++${value['covid']}');
      print('+++++++++++++++++++++++++++++++++++${value['people']}');
      print('+++++++++++++++++++++++++++++++++++${value['more7']}');
      print('+++++++++++++++++++++++++++++++++++${value['exp']}');
      print('+++++++++++++++++++++++++++++++++++${value['age']}');

      setState(() {
        name = value['name'];
        position = value['workPosition'];
        aboutCompany = value['aboutCompany'];
        amount = value['amount'];
        area = value['area'];
        companyName = value['companyName'];
        mission = value['mission'];
        pathPIC = value['picCompany'];
        province = value['province'];
        salary = value['salary'];
        status = value['status'];
        worktype = value['workType'];
        phone = value['phone'];
        email = value['email'];
        address = value['address'];
        gender = value['gender'];
        dateStop = value['dateStop'];
        more3 = value['more3'];
        more4 = value['more4'];
        bonus = value['bonus'];
        health = value['health'];
        hospital = value['hospital'];
        social = value['social'];
        timecost = value['timeCost'];
        covid = value['covid'];
        people = value['people'];
        more7 = value['more7'];
        exp = value['exp'];
        age = value['age'];
        show = false;
      });
    });

//     => then(function(document) {
//
// }
//     );
  }

  Widget dropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'รูปแบบงาน : ',
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
              value: status,
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
                  "เลือกรูปแบบงาน",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mitr'),
                ),
              ),
              onChanged: (dynamic value) {
                setState(() {
                  status = value;
                  // ignore: avoid_print
                  print(status);
                  // ignore: avoid_print
                  print('66666666666' + value);
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> route(Widget routeName) async {
    MaterialPageRoute materialPageRoute =
        MaterialPageRoute(builder: (BuildContext context) => routeName);
    await Navigator.of(context).push(materialPageRoute);
  }
}
