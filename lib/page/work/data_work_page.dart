import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataWork extends StatefulWidget {
  dynamic docid;
  DataWork({Key? key, this.docid}) : super(key: key);

  @override
  _DataWorkState createState() => _DataWorkState();
}

class _DataWorkState extends State<DataWork> {
  dynamic position,
      mission,
      companyName,
      aboutCompany,
      worktype,
      gender,
      age,
      exp,
      more3,
      bonus,
      social,
      health,
      timecost,
      hospital,
      covid,
      people,
      more4,
      amount,
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
  bool show = true;

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('work')
        .doc(widget.docid)
        .get()
        .then((value) {
      print('+++++++++++++++++++++++++++++++++++${value['name']}');
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ประกาศรับสมัครงาน'),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              show
                  ? Center(
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
                                // color: Colors.grey.shade200,
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
                                            if (pathPIC == null ||
                                                pathPIC == '')
                                              CircularProgressIndicator()
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
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        width: 200,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (status == 'open')
                                              Container(
                                                // color: Colors.green,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
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
                                            lineProgress(
                                              position,
                                              const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.purple),
                                            ),
                                            lineProgress(companyName,
                                                TextStyle(fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
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
                                            // maxLines: 2,
                                            // overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: 340,
                                        child: lineProgressIMG(
                                          aboutCompany,
                                          TextStyle(fontSize: 12),
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'รับสมัคร' +
                                                          '$worktype' +
                                                          'จำนวน' +
                                                          '\t' +
                                                          amount.toString() +
                                                          '\t' +
                                                          'คน',
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    ),
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
                                                            'คุณสมบัติ',
                                                            // maxLines: 2,
                                                            // overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
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
                                                                    ))
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  'อายุ : ',
                                                                  // maxLines: 2,
                                                                  // overflow: TextOverflow.ellipsis,
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
                                                                  // maxLines: 2,
                                                                  // overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'ประสบการณ์ : ',
                                                                  // maxLines: 2,
                                                                  // overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                lineProgress(
                                                                    exp,
                                                                    TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                    )),
                                                                Text(
                                                                  ' ปี',
                                                                  // maxLines: 2,
                                                                  // overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'คุณสมบัติเพิ่มเติม : ',
                                                                  // maxLines: 2,
                                                                  // overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              width: 300,
                                                              child:
                                                                  lineProgressIMG3(
                                                                      more3,
                                                                      TextStyle(
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
                                                  Container(
                                                    // color: Colors.green,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      color: Colors.purple,
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'หน้าที่ความรับผิดชอบ',
                                                        // maxLines: 2,
                                                        // overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      lineProgressIMG(
                                                          mission,
                                                          TextStyle(
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
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              if (bonus ==
                                                                  'true')
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
                                                                    children: [
                                                                      Icon(Icons
                                                                          .check),
                                                                      const Padding(
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
                                                                  'true')
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
                                                                    children: [
                                                                      Icon(Icons
                                                                          .check),
                                                                      const Padding(
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
                                                                  'true')
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
                                                                    children: [
                                                                      Icon(Icons
                                                                          .check),
                                                                      const Padding(
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
                                                                  'true')
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
                                                                    children: [
                                                                      Icon(Icons
                                                                          .check),
                                                                      const Padding(
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
                                                                  'true')
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
                                                                    children: [
                                                                      Icon(Icons
                                                                          .check),
                                                                      const Padding(
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
                                                                  'true')
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
                                                                    children: [
                                                                      Icon(Icons
                                                                          .check),
                                                                      const Padding(
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
                                                                  'true')
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
                                                                          // maxLines: 2,
                                                                          // overflow: TextOverflow.ellipsis,
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
                                              Text('สวัสดิการเพิ่มเติม :'),
                                            ],
                                          ),
                                          lineProgress(
                                              more4,
                                              TextStyle(
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
                                                            // maxLines: 2,
                                                            // overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
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
                                                  TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              // Text(
                                              //   'เบอร์ ',
                                              //   // maxLines: 2,
                                              //   // overflow: TextOverflow.ellipsis,
                                              //   style: TextStyle(
                                              //     fontSize: 14,
                                              //   ),
                                              // ),
                                              lineProgress(
                                                  phone,
                                                  TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              // Text(
                                              //   'เบอร์ ',
                                              //   // maxLines: 2,
                                              //   // overflow: TextOverflow.ellipsis,
                                              //   style: TextStyle(
                                              //     fontSize: 14,
                                              //   ),
                                              // ),
                                              lineProgress(
                                                  email,
                                                  TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              // Text(
                                              //   'เบอร์ ',
                                              //   // maxLines: 2,
                                              //   // overflow: TextOverflow.ellipsis,
                                              //   style: TextStyle(
                                              //     fontSize: 14,
                                              //   ),
                                              // ),
                                              Container(
                                                width: 300,
                                                child: lineProgress(
                                                    address,
                                                    TextStyle(
                                                      fontSize: 12,
                                                    )),
                                              ),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              // Text(
                                              //   'เบอร์ ',
                                              //   // maxLines: 2,
                                              //   // overflow: TextOverflow.ellipsis,
                                              //   style: TextStyle(
                                              //     fontSize: 14,
                                              //   ),
                                              // ),
                                              lineProgress(
                                                  province,
                                                  TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              lineProgress(
                                                  area,
                                                  TextStyle(
                                                    fontSize: 12,
                                                  )),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
                                              // lineProgress(name, TextStyle()),
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
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                            'รายละเอียดเพิ่มเติม',
                                                            // maxLines: 2,
                                                            // overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
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
                                                  more7,
                                                  TextStyle(
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

                            // Container(),
                            // RaisedButton(
                            //   onPressed: () {
                            //     print(
                            //         '******************************* ${widget.docid}');
                            //     get();
                            //     print(' aboutCompany: ${aboutCompany}');
                            //     print('  amount: ${amount}');
                            //     print('  area: ${area}');
                            //     print('companyName:${companyName},');
                            //     print('mission: ${mission}');
                            //     print('  picCompany: $pathPIC');
                            //     print('province:${province},');
                            //     print('salary: ${salary},');
                            //     print(' status: open,');
                            //     print(' workPosition: ${position},');
                            //     print('workType: ${worktype},');
                            //     print(' name: ${name},');
                            //     print('  phone:${phone},');
                            //     print('  email:${email}');
                            //     print(' address: ${address},');
                            //     print(' gender:${gender},');
                            //     print(' dateStop: ${dateStop},');
                            //     print(' more3 : ${more3},');
                            //     print(' more4: ${more4},');
                            //     print('  more7 : ${more7}');
                            //     print('age: ${age},');
                            //     print('exp: ${exp},');
                            //     print('bonus: ${bonus},');
                            //     print(' social: ${social},');
                            //     print(' health:${health},');
                            //     print('  timeCost:${timecost},');
                            //     print(' hospital: ${hospital},');
                            //     print('covid: ${covid},');
                            //     print('people: ${people},');
                            //     print('path:${pathPIC},');
                            //   },
                            // ),
                            // if (name == null || name == '')
                            //   LinearProgressIndicator()
                            // else
                            //   Text(name),
                            // // lineProgress(dateStop,),
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
        ? LinearProgressIndicator()
        : Text(
            data,
            style: style,
          );
  }

  Widget lineProgressIMG(data, TextStyle style) {
    return data == null
        ? LinearProgressIndicator()
        : Text(
            data,
            style: style,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          );
  }

  Widget lineProgressIMG3(data, TextStyle style) {
    return data == null
        ? LinearProgressIndicator()
        : Text(
            data,
            style: style,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          );
  }

  Widget lineProgressIMG2(data, TextStyle style) {
    return data == null
        ? LinearProgressIndicator()
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
}
